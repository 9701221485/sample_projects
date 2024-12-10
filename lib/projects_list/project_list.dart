import 'package:flutter/material.dart';
import 'package:project_samples/projects_list/project_list_view_model.dart';
import 'package:provider/provider.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProjectListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects list"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  viewModel.onTapProject(viewModel.projectList[index].route),
              child: Card(
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(viewModel.projectList[index].name)),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: viewModel.projectList.length),
    );
  }
}
