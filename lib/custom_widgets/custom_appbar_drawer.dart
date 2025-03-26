import 'package:flutter/material.dart';

class CustomAppbarDrawer extends StatefulWidget {
  const CustomAppbarDrawer({super.key});

  @override
  State<CustomAppbarDrawer> createState() => _CustomAppbarDrawerState();
}

class _CustomAppbarDrawerState extends State<CustomAppbarDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(106, 159, 106, 1),
                ),
                child: Center(
                  child: Text(
                    "VeraCT",
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text(
                "Dashboard",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text(
                "Employee Tasks",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/task');
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text(
                "201 Files",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/files');
              },
            ),
            ListTile(
              leading: Icon(Icons.work_history),
              title: Text(
                "Contribution History",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/contribution');
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books_sharp),
              title: Text(
                "Memo",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/memo');
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text(
                "Attendance",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/attendance');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                "Personnel Action Notice",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pan');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_rounded),
              title: Text(
                "Paycheck",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/paycheck');
              },
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode_outlined),
              title: Text(
                "Company Forms",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.poll_outlined),
              title: Text(
                "Poll Voting",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                  color: Colors.red[300],
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
