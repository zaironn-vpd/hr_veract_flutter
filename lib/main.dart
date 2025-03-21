import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/add_employee_widget.dart';
import 'package:hr_veract/pages/dashboard.dart';
import 'package:hr_veract/pages/employee_page.dart';
import 'package:hr_veract/pages/loginPage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => UserLoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/employees': (context) => EmployeePage(),
        '/add_employees': (context) => AddEmployeeWidget(),
      },
    ),
  );
}
