part of 'task_cubit.dart';

@immutable
sealed class TaskState {
  final List<Task> taskList;

  const TaskState(this.taskList);
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}
final class TaskUpdate extends TaskState {
  const TaskUpdate(super.taskList);
}
