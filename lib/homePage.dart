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
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInit) {
            return _view(context, []);
          }
          if (state is TodoUpdate) {
            return _view(context, state.todos);
          }
          return Container();
        },
      ),
    );

    //   body: BlocBuilder<TodoBloc, TodoState>(
    //     builder: (context, state) {
    //       if (state is TodoInit) {
    //         return _view(context, []);
    //       } else if (state is TodoUpdate) {
    //         return _view(context, state.todos);
    //       }
    //       return Container();
    //     },
    //   ),
    // );
    //
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

  Widget _view(BuildContext context, List<String> todos) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter a todo',
            ),
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  context.read<TodoBloc>().add(addTodo(_controller.text.trim()));
                  _controller.clear();
                }
              },
              child: const Text('Add ToDo'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(deleteTodo(index));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
