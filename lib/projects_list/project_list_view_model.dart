import 'package:flutter/material.dart';
import 'package:project_samples/main.dart';
import 'package:project_samples/projects_list/project_model.dart';
import 'package:project_samples/route_files/route_constants.dart';

class ProjectListViewModel extends ChangeNotifier {
  List<ProjectModel> projectList = [
    ProjectModel(
        name: "To Do App Wth Hive", route: RouteConstants.toDoAppWithHive)
  ];

  void onTapProject(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }
}
