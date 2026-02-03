// Model - Task Entity
class Task {
  final String id;
  final String title;
  final String description;
  final int color; // Color value as int
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.createdAt,
  });

  // Convert Task to Map for database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'color': color,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Task from Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      color: map['color'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // Copy with method for immutability
  Task copyWith({
    String? id,
    String? title,
    String? description,
    int? color,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
