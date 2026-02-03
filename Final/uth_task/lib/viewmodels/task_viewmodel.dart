import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';
import '../database/database_helper.dart';

// ViewModel - Business Logic Layer
class TaskViewModel extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  List<Task> _tasks = [];
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  // Load all tasks from database
  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _tasks = await _dbHelper.readAllTasks();
    } catch (e) {
      print('Error loading tasks: $e');
      _tasks = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add new task
  Future<void> addTask(String title, String description, int color) async {
    if (title.trim().isEmpty) return;

    final task = Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      color: color,
      createdAt: DateTime.now(),
    );

    try {
      await _dbHelper.create(task);
      await loadTasks(); // Reload to update UI
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  // Update existing task
  Future<void> updateTask(Task task) async {
    try {
      await _dbHelper.update(task);
      await loadTasks();
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  // Delete task
  Future<void> deleteTask(String id) async {
    try {
      await _dbHelper.delete(id);
      await loadTasks();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}
