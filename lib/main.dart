import 'package:flutter/material.dart';
import 'package:my_listview_effect/views/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.deepPurple
      ),
      home: Home(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}