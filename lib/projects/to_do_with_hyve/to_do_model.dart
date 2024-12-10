import 'package:hive/hive.dart';

// part 'todo.g.dart'; // This line is necessary for code generation

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  final String title;

  @HiveField(1)
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}
