import 'package:flutter/material.dart';
import 'package:hr_veract/pages/dashboard.dart';
import 'package:hr_veract/pages/employees.dart';
import 'package:hr_veract/pages/loginPage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => UserLoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/employees': (context) => EmployeesPage(),
      },
    ),
  );
}
