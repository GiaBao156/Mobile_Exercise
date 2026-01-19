import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final TaskService _taskService = TaskService();
  
  TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    Color statusColor = task.status == 'Completed' ? Colors.green 
        : task.status == 'In Progress' ? Colors.orange : Colors.blue;
    Color priorityColor = task.priority == 'High' ? Colors.red 
        : task.priority == 'Medium' ? Colors.orange : Colors.green;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF00BCD4)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Task Detail', style: TextStyle(color: Color(0xFF00BCD4), fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _showDeleteDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(task.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            // Status & Priority chips
            Row(
              children: [
                _buildChip(task.status, statusColor),
                const SizedBox(width: 8),
                _buildChip(task.priority, priorityColor),
                const SizedBox(width: 8),
                _buildChip(task.category, const Color(0xFF00BCD4)),
              ],
            ),
            const SizedBox(height: 24),
            
            // Due date
            _buildInfoRow(Icons.calendar_today, 'Due Date', 
              task.dueDate != null ? '${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}' : 'No date'),
            const SizedBox(height: 16),
            
            // Description
            const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(task.description.isNotEmpty ? task.description : 'No description', 
              style: TextStyle(color: Colors.grey[600], height: 1.5)),
            const SizedBox(height: 32),
            
            // Action buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _taskService.toggleTaskStatus(task);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(task.status == 'Completed' ? 'Task reopened!' : 'Task completed!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  task.status == 'Completed' ? 'Reopen Task' : 'Mark as Complete',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _taskService.deleteTask(task.id);
              Navigator.pop(ctx);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task deleted'), backgroundColor: Colors.red),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF00BCD4), size: 20),
        const SizedBox(width: 8),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(value, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}
