import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "PoppinsBold",
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(106, 159, 106, 1),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        TextButton(
          onPressed: () {
            print("Edit button pressed");
          },
          child: Text(
            "Edit",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
