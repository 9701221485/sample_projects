import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_samples/providers/provider_list.dart';
import 'package:project_samples/route_files/app_routes.dart';
import 'package:project_samples/route_files/route_constants.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.all(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        initialRoute: RouteConstants.initialRoute,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
