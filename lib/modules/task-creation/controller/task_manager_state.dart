part of 'task_manager_cubit.dart';

class TaskManagerState extends Equatable {
  const TaskManagerState({
    required this.tasks,
    this.buttonDisabled = true,
  });

  final bool buttonDisabled;
  final List<TaskModel> tasks;

  TaskManagerState copyWith({
    bool? buttonDisabled,
    List<TaskModel>? tasks,
  }) {
    return TaskManagerState(
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [
        buttonDisabled,
        tasks,
      ];
}
