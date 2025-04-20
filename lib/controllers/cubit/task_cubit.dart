import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/task-model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  int _currentId = 0;

  int get nextId => ++_currentId;

  addTask(String title) {
    Task task = Task(id: nextId, title: title);
    //emit(TaskUpdate(List.from(state.taskList)..add(task)));
    emit(TaskUpdate([...state.taskList, task]));
  }

  removeTask(int id) {
    final List<Task> newTaskList = state.taskList.where((task) => task.id != id)
        .toList();
    emit(TaskUpdate(newTaskList));
    --_currentId;
  }

  toggleTask(int id) {
    List<Task> newTaskList = state.taskList.map((task) =>
    task.id == id ? task.copyWith(isCompleted: !task.isCompleted): task).toList();
    emit(TaskUpdate(newTaskList));
  }
}
