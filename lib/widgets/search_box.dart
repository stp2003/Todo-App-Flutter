import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  // final List<ToDODataBase> toDoList;

  const SearchBox({
    super.key,
    // required this.toDoList,
  });

  //?? search functionality ->
  // void search(String enteredText) {
  //   List<ToDODataBase>? result = [];
  //   if (enteredText.isEmpty) {
  //     result = toDoList;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const TextField(
        style: TextStyle(
            color: Colors.black, letterSpacing: 0.8, fontFamily: 'poppins'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20.0,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20.0,
            minWidth: 25.0,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
