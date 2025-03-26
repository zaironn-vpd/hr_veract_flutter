import 'package:flutter/material.dart';
import 'package:hr_veract/pages/pan_page.dart';
import 'package:hr_veract/pages/attendance_page.dart';
import 'package:hr_veract/pages/contribution_history_page.dart';
import 'package:hr_veract/pages/dashboard_page.dart';
import 'package:hr_veract/pages/employee_profile_page.dart';
import 'package:hr_veract/pages/employee_task_page.dart';
import 'package:hr_veract/pages/files_page.dart';
import 'package:hr_veract/pages/login_page.dart';
import 'package:hr_veract/pages/memo_page.dart';
import 'package:hr_veract/pages/paycheck_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => UserLoginPage(),
        '/dashboard': (context) => Dashboardpage(),
        '/profile': (context) => EmployeeProfilePage(),
        '/memo': (context) => MemoPage(),
        '/attendance': (context) => AttendancePage(),
        '/pan': (context) => PanPage(),
        '/files': (context) => FilesPage(),
        '/contribution': (context) => ContributionHistoryPage(),
        '/paycheck': (context) => PaycheckPage(),
        '/task': (context) => EmployeeTaskPage(),
      },
    ),
  );
}
