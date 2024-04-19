import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'task_creation_state.dart';

class TaskCreationCubit extends Cubit<TaskCreationState> {
  TaskCreationCubit() : super(const TaskCreationState());

  void setNewValue() {
    emit(state.copyWith(testText: ''));
  }
}
