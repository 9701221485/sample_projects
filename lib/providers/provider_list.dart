import 'package:project_samples/projects_list/project_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> all() {
    return [
      ChangeNotifierProvider(
        create: (context) => ProjectListViewModel(),
      ),
      // Add more providers here
      // ChangeNotifierProvider(create: (context) => AnotherViewModel()),
    ];
  }
}
