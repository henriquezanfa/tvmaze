import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/core/routes/routes.dart';
import 'package:tvmaze/core/theme/theme.dart';
import 'package:tvmaze/feature/home/presentation/ui/home_page.dart';

void main() {
  setup();

  runApp(const TVMazeApp());
}

class TVMazeApp extends StatelessWidget {
  const TVMazeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Maze App',
      theme: lightTheme,
      home: const HomePage(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
