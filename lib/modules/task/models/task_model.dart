import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:task_hub/core/helpers/helpers.dart';
import 'package:task_hub/core/styles/styles.dart';

class TaskModel {
  TaskModel._({
    required this.id,
    required this.title,
    required this.description,
    required this.resolved,
    required this.priority,
    required this.date,
    required this.resolvedDate,
  });

  factory TaskModel.create({
    required String title,
    required String description,
    required int priority,
    required DateTime date,
    bool resolved = false,
  }) {
    return TaskModel._(
      id: idGenerator(),
      title: title,
      description: description,
      resolved: resolved,
      priority: priority,
      date: date,
      resolvedDate: DateTime.now(),
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel._(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      resolved: json['resolved'] as bool,
      priority: json['priority'] as int,
      date: DateTime.parse(json['date'] as String),
      resolvedDate: DateTime.parse(json['resolvedDate'] as String),
    );
  }

  factory TaskModel.deserialize(String json) {
    return TaskModel.fromJson(
      jsonDecode(json) as Map<String, dynamic>,
    );
  }

  final String id;
  final String title;
  final String description;
  final bool resolved;
  final int priority;
  final DateTime date;
  final DateTime resolvedDate;

  String get onlyDate => DateFormat('dd/MM/yyyy').format(date);
  String get onlyHour => DateFormat('HH:mm').format(date);
  String get onlyDateResolved => DateFormat('dd/MM/yyyy').format(resolvedDate);
  String get onlyHourResolved => DateFormat('HH:mm').format(resolvedDate);

  String get priorityString {
    switch (priority) {
      case 2:
        return 'Alta';
      case 1:
        return 'Média';
      case 0:
        return 'Baixa';
      default:
        return 'Média';
    }
  }

  Color get priorityColor {
    switch (priority) {
      case 2:
        return AppColors.error;
      case 1:
        return AppColors.warning;
      case 0:
        return AppColors.deepSkyBlue;
      default:
        return AppColors.warning;
    }
  }

  TaskModel copyWith({
    String? description,
    String? title,
    int? priority,
    DateTime? date,
    DateTime? resolvedDate,
    bool? resolved,
  }) {
    return TaskModel._(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      resolved: resolved ?? this.resolved,
      priority: priority ?? this.priority,
      date: date ?? this.date,
      resolvedDate: resolvedDate ?? this.resolvedDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'resolved': resolved,
      'priority': priority,
      'date': date.toString(),
      'resolvedDate': resolvedDate.toString(),
    };
  }

  String serialize() {
    return jsonEncode(toJson());
  }
}
