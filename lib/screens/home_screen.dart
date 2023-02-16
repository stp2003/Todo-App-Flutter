import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          children: const [

            //?? Custom Search box widget ->
            SearchBox(),
          ],
        ),
      ),
    );
  }
}

