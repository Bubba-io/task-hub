part of 'task_manager_cubit.dart';

class TaskManagerState extends Equatable {
  const TaskManagerState({
    this.buttonDisabled = true,
  });

  final bool buttonDisabled;

  TaskManagerState copyWith({
    bool? buttonDisabled,
  }) {
    return TaskManagerState(
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
    );
  }

  @override
  List<Object> get props => [
        buttonDisabled,
      ];
}
