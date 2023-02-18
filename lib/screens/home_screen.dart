import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app_flutter/database/database.dart';
import 'package:todo_app_flutter/utils/dialog_box.dart';
import 'package:todo_app_flutter/utils/todo_tile.dart';

import '../widgets/app_bar.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //?? reference the hive box ->
  final _myBox = Hive.box('myBox');
  ToDODataBase dataBase = ToDODataBase();

  //**** init state ->
  @override
  void initState() {
    super.initState();

    //** if the1st time opening the app ->
    if (_myBox.get('TODOLIST') == null) {
      dataBase.createInitialData();
    } else {
      dataBase.loadData();
    }
  }

  //** init TextEditingController ->
  final controller = TextEditingController();

  //?? checkBoxChanged method ->
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      dataBase.toDoList[index][1] = !dataBase.toDoList[index][1];
    });
    dataBase.updateDataBase();
  }

  //?? saving new task ->
  void saveNewTask() {
    setState(() {
      dataBase.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    dataBase.updateDataBase();
  }

  //?? createNewTask ->
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //?? delete task ->
  void deleteTask(int index) {
    setState(() {
      dataBase.toDoList.removeAt(index);
    });
    dataBase.updateDataBase();
  }

  //?? build function ->
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //** appBar ->
      appBar: const AppBAR(),

      //** floating action button ->
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 25.0,
        ),
      ),

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
                itemCount: dataBase.toDoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskName: dataBase.toDoList[index][0],
                    taskCompleted: dataBase.toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteTask: (context) => deleteTask(index),
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
