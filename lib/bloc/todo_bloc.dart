// import 'package:bloc_todo/bloc/todo_event.dart';
// import 'package:bloc_todo/bloc/todo_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ToDo {
//   static List<String> data = ['aghdf', 'asfiasjfg', 'sfhas', 'Any'];
// }
//
// class TodoBloc extends Bloc<TodoEvent,TodoState>{
//   TodoBloc():super(TodoUpdate(todos: ToDo.data)){
//     on<addTodo>((event,emit){
//
//     });
//   }
//
// }

import 'package:bloc_todo/bloc/todo_event.dart';
import 'package:bloc_todo/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDo {
  static List<String> data = ['aghdf', 'asfiasjfg', 'sfhas', 'Any'];
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoUpdate(todos: ToDo.data)) {

    on<addTodo>((event, emit) {
      ToDo.data.add(event.title);
      emit(TodoUpdate(todos: List.from(ToDo.data)));
    });

    on<deleteTodo>((event, emit) {
      if (event.index >= 0 && event.index < ToDo.data.length) {
        ToDo.data.removeAt(event.index);
        emit(TodoUpdate(todos: List.from(ToDo.data)));
      }
    });
  }
}
