part of 'task_creation_cubit.dart';

class TaskCreationState extends Equatable {
  const TaskCreationState({
    this.testText = '',
  });

  final String testText;

  TaskCreationState copyWith({
    String? testText,
  }) {
    return TaskCreationState(
      testText: testText ?? this.testText,
    );
  }

  @override
  List<Object> get props => [
        testText,
      ];
}
