import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

// Database Helper - Room equivalent for Flutter
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tasks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE tasks (
        id $idType,
        title $textType,
        description $textType,
        color $integerType,
        createdAt $textType
      )
    ''');
  }

  // Insert task
  Future<Task> create(Task task) async {
    final db = await instance.database;
    await db.insert('tasks', task.toMap());
    return task;
  }

  // Read all tasks
  Future<List<Task>> readAllTasks() async {
    final db = await instance.database;
    final result = await db.query('tasks', orderBy: 'createdAt DESC');
    return result.map((json) => Task.fromMap(json)).toList();
  }

  // Read single task
  Future<Task?> readTask(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Update task
  Future<int> update(Task task) async {
    final db = await instance.database;
    return db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // Delete task
  Future<int> delete(String id) async {
    final db = await instance.database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
