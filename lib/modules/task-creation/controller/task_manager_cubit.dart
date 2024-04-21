import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_hub/core/storage/storage.dart';
import 'package:task_hub/modules/task-creation/models/models.dart';

part 'task_manager_state.dart';

class TaskManagerCubit extends Cubit<TaskManagerState> {
  TaskManagerCubit() : super(const TaskManagerState());

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController hour = TextEditingController();
  final TextEditingController priority = TextEditingController();

  Future<void> createTask() async {
    final task = TaskModel.create(
      title: title.text,
      description: description.text,
      priority: setPriority(),
      date: convertDate(),
    );

    await DataStorage().write(task.id, task.serialize());
  }

  int setPriority() {
    switch (priority.text) {
      case 'Alta':
        return 3;
      case 'Média':
        return 2;
      case 'Baixa':
        return 1;
      default:
        return 2;
    }
  }

  DateTime convertDate() {
    final dateParsed = DateFormat('dd-MM-yyyy').parse(date.text);
    final timeParsed = DateFormat('HH:mm').parse(hour.text);

    return DateTime(
      dateParsed.year,
      dateParsed.month,
      dateParsed.day,
      timeParsed.hour,
      timeParsed.minute,
      timeParsed.second,
      DateTime.now().microsecond,
    );
  }

  void checkButtonState() {
    late bool result;

    if (title.text.isNotEmpty &&
        description.text.isNotEmpty &&
        date.text.isNotEmpty &&
        hour.text.isNotEmpty &&
        priority.text.isNotEmpty) {
      result = false;
    } else {
      result = true;
    }

    emit(state.copyWith(buttonDisabled: result));
  }

  void reset() {
    title.clear();
    description.clear();
    date.clear();
    hour.clear();
    priority.clear();

    emit(state.copyWith(buttonDisabled: true));
  }
}
