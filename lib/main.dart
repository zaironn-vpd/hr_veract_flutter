import 'package:flutter/material.dart';
import 'package:hr_veract/pages/attendance_page.dart';
import 'package:hr_veract/pages/dashboardPage.dart';
import 'package:hr_veract/pages/employee_page.dart';
import 'package:hr_veract/pages/employee_profile_page.dart';
import 'package:hr_veract/pages/loginPage.dart';
import 'package:hr_veract/pages/memo_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => UserLoginPage(),
        '/dashboard': (context) => Dashboardpage(),
        '/employees': (context) => EmployeePage(),
        '/profile': (context) => EmployeeProfilePage(),
        '/memo': (context) => MemoPage(),
        '/attendance': (context) => AttendancePage(),
      },
    ),
  );
}
