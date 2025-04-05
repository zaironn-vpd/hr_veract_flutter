import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/views/pages/leave_form_page.dart';
import 'package:hr_veract/views/pages/overtime_form_page.dart';
import 'package:hr_veract/views/pages/overtime_list_page.dart';
import 'package:hr_veract/views/pages/poll_voting_page.dart';
import 'package:hr_veract/views/pages/task_list_page.dart';
import 'package:hr_veract/views/pages/leave_list_page.dart';
import 'package:hr_veract/views/pages/pan_page.dart';
import 'package:hr_veract/views/pages/attendance_page.dart';
import 'package:hr_veract/views/pages/contribution_history_page.dart';
import 'package:hr_veract/views/pages/dashboard_page.dart';
import 'package:hr_veract/views/pages/employee_profile_page.dart';
import 'package:hr_veract/views/pages/employee_task_page.dart';
import 'package:hr_veract/views/pages/files_page.dart';
import 'package:hr_veract/src/features/auth/ui/login_page.dart';
import 'package:hr_veract/views/pages/memo_page.dart';
import 'package:hr_veract/views/pages/paycheck_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
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
    ),
  );
}
