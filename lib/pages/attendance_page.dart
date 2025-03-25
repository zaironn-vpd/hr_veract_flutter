import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/attendance_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return AttendanceWidget(
            pageTitleWidth: 135,
            pageTitleTextSize: 14,
            screenWidth: 280,
            headerTextSize: 8,
            dataTextSize: 7,
            searchBarTextSize: 8,
            searchBarWidth: 135,
          );
        } else {
          return AttendanceWidget(
            pageTitleWidth: 175,
            pageTitleTextSize: 16,
            screenWidth: 510,
            headerTextSize: 10,
            dataTextSize: 10,
            searchBarTextSize: 12,
            searchBarWidth: 300,
          );
        }
      },
    );
  }
}
