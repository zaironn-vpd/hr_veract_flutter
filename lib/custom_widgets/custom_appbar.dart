import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double textSize;
  final List<Widget>? actions;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.textSize,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "PoppinsBold",
          fontWeight: FontWeight.bold,
          fontSize: textSize,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(106, 159, 106, 1),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
