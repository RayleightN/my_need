part of 'list_task_cubit.dart';

abstract class ListTaskState extends Equatable {
  final List<Task>? tasks;
  const ListTaskState({this.tasks});

  ListTaskState copyWith({List<Task>? tasks}) {
    return ListTaskLoaded(tasks: tasks ?? this.tasks);
  }
}

class ListTaskInitial extends ListTaskState {
  @override
  List<Object> get props => [];
}

class ListTaskLoaded extends ListTaskState {
  final List<Task>? tasks;
  const ListTaskLoaded({this.tasks});
  @override
  List<dynamic> get props => [tasks];
}
