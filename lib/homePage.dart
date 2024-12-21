import 'package:bloc_todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_event.dart';
import 'bloc/todo_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInit) {
            return _view(context, '');
          }
          if (state is TodoUpdate) {
            return _view(context, state.todos[]);
          }
          return Container();
        },
      ),
    );
    // return Scaffold(
    //     body: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
    //   if (state is TodoUpdate) {
    //     final todos = state.todos;
    //
    //     return ListView.builder(
    //       itemCount: todos.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text(todos[index]),
    //           trailing: IconButton(
    //             icon: const Icon(Icons.delete, color: Colors.red),
    //             onPressed: () {
    //               context.read<TodoBloc>().add(deleteTodo(index));
    //             },
    //           ),
    //         );
    //       },
    //     );
    //   }
    //   return const Center(child: Text('No todos available.'));
    // }));
  }

  Widget _view(BuildContext context,String todos){
    return Column(
      children: [
        TextField(
          controller: _controller,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              context.read<TodoBloc>().add(addTodo(_controller.text));
              _controller.text='';
            },
            child: Text('Add ToDo'),
          ),
        ),
        Expanded(
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(todos[index]),),
                            IconButton(
                              onPressed: () {
                                context.read<TodoBloc>().add(deleteTodo(index));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
