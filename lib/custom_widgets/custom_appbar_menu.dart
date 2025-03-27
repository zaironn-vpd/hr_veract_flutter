import 'package:flutter/material.dart';

class CustomAppbarMenu extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  const CustomAppbarMenu({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontFamily: 'PoppinsBold',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16,
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
              Navigator.pushNamed(context, '/profile');
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profilePic.jpg'),
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
