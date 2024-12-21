import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {}

class TodoInit extends TodoState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoUpdate extends TodoState {
  List<String> todos;
  TodoUpdate({required this.todos});
  @override
  // TODO: implement props
  List<Object?> get props => [todos];
}
