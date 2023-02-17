import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/todo_tile.dart';

import '../widgets/app_bar.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //** list of todos ->
  List todoList = [
    ['Make ToDo', false],
    ['Make Chai', true],
  ];

  //?? checkBoxChanged method ->
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //** appBar ->
      appBar: const AppBAR(),

      //** body ->
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            //?? Custom Search box widget ->
            const SearchBox(),
            //?? list of todos ->
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskName: todoList[index][0],
                    taskCompleted: todoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
