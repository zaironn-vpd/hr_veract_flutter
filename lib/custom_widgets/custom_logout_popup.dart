import 'package:flutter/material.dart';

class BackPressLogout extends StatefulWidget {
  @override
  _BackPressLogoutState createState() => _BackPressLogoutState();
}

class _BackPressLogoutState extends State<BackPressLogout> {
  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text("Logout"),
                content: const Text("Are you sure you want to log out?"),
                actions: [
                  TextButton(
                    onPressed:
                        () =>
                            Navigator.of(context).pop(false), // Dismiss dialog
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // Confirm logout
                    },
                    child: const Text("Logout"),
                  ),
                ],
              ),
        ) ??
        false; // Return false if dismissed
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: const Center(child: Text("Press back to see logout dialog")),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: BackPressLogout()));
}
