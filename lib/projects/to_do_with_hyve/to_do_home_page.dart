import 'package:flutter/material.dart';
import 'package:project_samples/projects/to_do_with_hyve/utils/to_do_card.dart';

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  State<ToDoHomePage> createState() => ToDoHomePageState();
}

class ToDoHomePageState extends State<ToDoHomePage> {
  List toDoList = [
    ["Sample Task", false]
  ];

  onTapOfTask(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
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
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          body: ListView.separated(
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
          ),
        ));
  }
}
