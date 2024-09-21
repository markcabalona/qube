import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qube/core/dependencies/dependencies.dart';
import 'package:qube/core/router/qube_router.dart';
import 'package:qube/core/theme/qube_theme.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'QUBE',
      theme: ThemeData(),
      darkTheme: GetIt.instance<QubeTheme>().dark(),
      themeMode: ThemeMode.dark,
      routeInformationParser: QubeRouter.routeInformationParser,
      routeInformationProvider: QubeRouter.routeInformationProvider,
      routerDelegate: QubeRouter.routerDelegate,
    );
  }
}
