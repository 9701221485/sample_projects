import 'package:flutter/material.dart';
import 'package:project_samples/projects/to_do_with_hyve/to_do_home_page.dart';
import 'package:project_samples/projects_list/project_list.dart';
import 'package:project_samples/route_files/route_constants.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const ProjectList(),
        );
      case RouteConstants.toDoAppWithHive:
        return MaterialPageRoute(
          builder: (context) => const ToDoHomePage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(child: Text("Empty Page")));
    }
  }
}
