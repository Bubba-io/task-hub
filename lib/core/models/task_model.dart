import 'dart:convert';

import 'package:task_hub/core/helpers/helpers.dart';

class TaskModel {
  TaskModel._({
    required this.id,
    required this.description,
    required this.resolved,
    required this.priority,
    required this.date,
  });

  factory TaskModel.create({
    required String description,
    required int priority,
    required DateTime date,
    bool resolved = false,
  }) {
    return TaskModel._(
      id: idGenerator(),
      description: description,
      resolved: resolved,
      priority: priority,
      date: date,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel._(
      id: json['id'] as String,
      description: json['description'] as String,
      resolved: json['resolved'] as bool,
      priority: json['priority'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }

  factory TaskModel.deserialize(String json) {
    return TaskModel.fromJson(
      jsonDecode(json) as Map<String, dynamic>,
    );
  }

  final String id;
  final String description;
  final bool resolved;
  final int priority;
  final DateTime date;

  TaskModel copyWith({
    String? description,
    int? priority,
    DateTime? date,
    bool? resolved,
  }) {
    return TaskModel._(
      id: id,
      description: description ?? this.description,
      resolved: resolved ?? this.resolved,
      priority: priority ?? this.priority,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'resolved': resolved,
      'priority': priority,
      'date': date.toString(),
    };
  }

  String serialize() {
    return jsonEncode(toJson());
  }
}
