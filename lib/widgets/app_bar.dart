import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/colors.dart';

class AppBAR extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  const AppBAR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appBarColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            (Icons.sort_sharp),
            color: Colors.white,
            size: 25.0,
          ),
          const Text(
            'ToDo',
            style: TextStyle(
              fontFamily: 'poppins_bold',
            ),
          ),
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/avatar.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
