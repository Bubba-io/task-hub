part of 'task_manager_cubit.dart';

class TaskManagerState extends Equatable {
  const TaskManagerState({
    required this.tasks,
    this.selectedID = '',
    this.selectedIndex = -1,
    this.buttonDisabled = true,
  });

  final bool buttonDisabled;
  final String selectedID;
  final int selectedIndex;
  final List<TaskModel> tasks;

  TaskManagerState copyWith({
    bool? buttonDisabled,
    String? selectedID,
    int? selectedIndex,
    List<TaskModel>? tasks,
  }) {
    return TaskManagerState(
      selectedID: selectedID ?? this.selectedID,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [
        selectedID,
        selectedIndex,
        buttonDisabled,
        tasks,
      ];
}
