import 'package:hive_flutter/hive_flutter.dart';

class ToDODataBase {
  List toDoList = [];

  //** reference the hive box ->
  final _myBox = Hive.box('myBox');

  //** running this if this is the 1st time opening this app ->
  void createInitialData() {
    toDoList = [
      ['Do 5 DSA questions', false],
      ['Work on a Flutter Project', false],
    ];
  }

  //?? load the data from dataBase ->
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //?? update the database ->
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
