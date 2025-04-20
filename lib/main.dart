import 'dart:math';

import 'package:bloc_statemanagement/controllers/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => TaskBloc(),
        child: MyHomePage(title: 'Flutter BLoC'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final controllerCubit = context.read<TaskCubit>();
    final controllerBloc = context.read<TaskBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'New Task'),
            ),
            ElevatedButton(
              onPressed: () {
                if(_controller.text.isEmpty) return;
                //controllerCubit.addTask(_controller.text);
                controllerBloc.add(AddTask(_controller.text));
                _controller.clear();
              },
              child: Text('add task'),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.taskList.length,
                    itemBuilder: (context, i) {
                      print(state.taskList.length);
                      print(state.taskList[i]);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.taskList[i].title),
                          Row(
                            children: [
                              Checkbox(
                                value: state.taskList[i].isCompleted,
                                onChanged: (v) {
                                  //controllerCubit.toggleTask(state.taskList[i].id);
                                  controllerBloc.add(ToggleTask(state.taskList[i].id));
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  //controllerCubit.removeTask(state.taskList[i].id);
                                  controllerBloc.add(RemoveTask(state.taskList[i].id));
                                },
                                icon: Icon(Icons.delete, color: Colors.red,),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
