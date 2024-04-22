part of 'task_manager_cubit.dart';

class TaskManagerState extends Equatable {
  const TaskManagerState({
    required this.tasks,
    required this.calendarFilter,
    this.selectedID = '',
    this.filter = 0,
    this.buttonDisabled = true,
    this.tabSelected = 0,
  });

  final bool buttonDisabled;
  final int tabSelected;
  final int filter;
  final String selectedID;
  final List<TaskModel> tasks;
  final DateTime calendarFilter;

  TaskManagerState copyWith({
    bool? buttonDisabled,
    int? tabSelected,
    int? filter,
    String? selectedID,
    List<TaskModel>? tasks,
    DateTime? calendarFilter,
  }) {
    return TaskManagerState(
      selectedID: selectedID ?? this.selectedID,
      tabSelected: tabSelected ?? this.tabSelected,
      filter: filter ?? this.filter,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
      tasks: tasks ?? this.tasks,
      calendarFilter: calendarFilter ?? this.calendarFilter,
    );
  }

  @override
  List<Object> get props => [
        selectedID,
        buttonDisabled,
        filter,
        tabSelected,
        tasks,
        calendarFilter,
      ];
}
