import 'package:flutter/material.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'What do you feel like watching today?',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
