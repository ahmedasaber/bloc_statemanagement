part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class AddTask extends TaskEvent{
  final String title;

  AddTask(this.title);
}

final class RemoveTask extends TaskEvent{
  final int id;

  RemoveTask(this.id);
}

final class ToggleTask extends TaskEvent{
  final int id;

  ToggleTask(this.id);
}
