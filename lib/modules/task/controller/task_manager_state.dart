part of 'task_manager_cubit.dart';

class TaskManagerState extends Equatable {
  const TaskManagerState({
    required this.tasks,
    this.selectedID = '',
    this.buttonDisabled = true,
    this.tabSelected = 0,
  });

  final bool buttonDisabled;
  final int tabSelected;
  final String selectedID;
  final List<TaskModel> tasks;

  TaskManagerState copyWith({
    bool? buttonDisabled,
    int? tabSelected,
    String? selectedID,
    int? selectedIndex,
    List<TaskModel>? tasks,
  }) {
    return TaskManagerState(
      selectedID: selectedID ?? this.selectedID,
      tabSelected: tabSelected ?? this.tabSelected,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [
        selectedID,
        buttonDisabled,
        tabSelected,
        tasks,
      ];
}
