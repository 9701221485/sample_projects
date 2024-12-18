import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:project_samples/projects/to_do_with_hyve/utils/to_do_card.dart';

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  State<ToDoHomePage> createState() => ToDoHomePageState();
}

class ToDoHomePageState extends State<ToDoHomePage> {
  TextEditingController newTask = TextEditingController();
  List toDoList = [
    ["Sample Task", false]
  ];

  onTapOfTask(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  createNewTask() {
    setState(() {
      toDoList.add([newTask.text, false]);
      newTask.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.yellow.shade800),
          scaffoldBackgroundColor: Colors.yellow.shade300,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ToDo List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => newTaskBottomSheet(),
          child: const Icon(Icons.add),
        ),
        body: toDoListWidget(),
      ),
    );
  }

  ListView toDoListWidget() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: (context, index) {
        return ToDoCard(
          name: toDoList[index][0],
          isTaskCompleted: toDoList[index][1],
          onTapOfTask: () {
            if (!toDoList[index][1]) {
              onTapOfTask(index);
            }
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemCount: toDoList.length,
    );
  }

  newTaskBottomSheet() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow.shade300,
          title: const Text('Enter Task'),
          content: TextField(
            controller: newTask,
            decoration: const InputDecoration(
              hintText: 'Type something...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                createNewTask();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
