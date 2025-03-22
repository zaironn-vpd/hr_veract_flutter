import 'package:flutter/material.dart';

class CustomAppbarMenu extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "VeraCT",
        style: TextStyle(
          fontFamily: 'PoppinsBold',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
          letterSpacing: 2,
        ),
      ),
      backgroundColor: Color.fromRGBO(106, 159, 106, 1),
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
              print("Profile image tapped!");
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'images/profilePic.jpg',
              ), // Change to your image
              radius: 18,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
