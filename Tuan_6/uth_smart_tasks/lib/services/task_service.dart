import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task_model.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  CollectionReference get _tasksCollection =>
      _firestore.collection('users').doc(_userId).collection('tasks');

  // Get all tasks stream
  Stream<List<Task>> getTasksStream() {
    if (_userId == null) return Stream.value([]);
    
    return _tasksCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Task.fromFirestore(doc))
            .toList());
  }

  // Add new task
  Future<void> addTask(Task task) async {
    if (_userId == null) return;
    
    await _tasksCollection.add(task.toFirestore());
  }

  // Update task
  Future<void> updateTask(Task task) async {
    if (_userId == null) return;
    
    await _tasksCollection.doc(task.id).update(task.toFirestore());
  }

  // Delete task
  Future<void> deleteTask(String taskId) async {
    if (_userId == null) return;
    
    await _tasksCollection.doc(taskId).delete();
  }

  // Toggle task status
  Future<void> toggleTaskStatus(Task task) async {
    if (_userId == null) return;
    
    final newStatus = task.status == 'Completed' ? 'Pending' : 'Completed';
    await _tasksCollection.doc(task.id).update({'status': newStatus});
  }
}
