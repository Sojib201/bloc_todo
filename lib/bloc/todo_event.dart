import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {}

class addTodo extends TodoEvent {
  final String title;
  addTodo(this.title);
  @override
  List<Object?> get props => [title];
}

class deleteTodo extends TodoEvent {
  final int index;
  deleteTodo(this.index);
  @override
  List<Object?> get props => [index];
}
