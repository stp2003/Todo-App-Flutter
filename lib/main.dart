import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app_flutter/constants/colors.dart';
import 'package:todo_app_flutter/screens/home_screen.dart';

void main() async {
  //?? initialize hive ->
  await Hive.initFlutter();

  //?? open the box ->
  var box = await Hive.openBox('myBox');

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App Flutter',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      home: const HomeScreen(),
    );
  }

