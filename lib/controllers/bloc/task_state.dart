part of 'task_bloc.dart';

@immutable
sealed class TaskState extends Equatable{
  final List<Task> taskList;

  const TaskState(this.taskList);

  @override
  List<Object?> get props => [taskList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}
final class TaskUpdate extends TaskState {
  const TaskUpdate(super.taskList);
}