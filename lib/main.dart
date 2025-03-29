import 'package:flutter/material.dart';
import 'package:hr_veract/pages/leave_form_page.dart';
import 'package:hr_veract/pages/overtime_form_page.dart';
import 'package:hr_veract/pages/overtime_list_page.dart';
import 'package:hr_veract/pages/poll_voting_page.dart';
import 'package:hr_veract/pages/task_list_page.dart';
import 'package:hr_veract/pages/leave_list_page.dart';
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
        '/taskList': (context) => TaskListPage(),
        '/leaveList': (context) => LeaveListPage(),
        '/leaveForm': (context) => LeaveFormPage(),
        '/overtimeList': (context) => OvertimeListPage(),
        '/overtimeForm': (context) => OvertimeFormPage(),
        '/pollVoting': (context) => PollVotingPage(),
      },
    ),
  );
}
