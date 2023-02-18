import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          letterSpacing: 0.8,
          fontFamily: 'poppins',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12.0, left: 8.0),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 20.0,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20.0,
            minWidth: 25.0,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
