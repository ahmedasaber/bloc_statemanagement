import 'package:bloc_statemanagement/model/task-model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  int _currentId = 0;

  int get nextId => ++_currentId;

  TaskBloc() : super(TaskInitial()) {
    on<AddTask>((event, emit) {
      Task task = Task(id: nextId, title: event.title);
      //emit(TaskUpdate(List.from(state.taskList)..add(task)));
      emit(TaskUpdate([...state.taskList, task]));
    });
    on<RemoveTask>((event, emit) {
      final List<Task> newTaskList = state.taskList.where((task) => task.id != event.id)
          .toList();
      emit(TaskUpdate(newTaskList));
      --_currentId;
    });
    on<ToggleTask>((event, emit) {
      List<Task> newTaskList = state.taskList.map((task) =>
      task.id == event.id ? task.copyWith(isCompleted: !task.isCompleted): task).toList();
      emit(TaskUpdate(newTaskList));
    });
  }
}
