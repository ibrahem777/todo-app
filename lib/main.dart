import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/tasks_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider.value(
        value: TasksProvider(),
        child: HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {}
}
