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
            pageTitleWidth: 120,
            pageTitleTextSize: 14,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        } else {
          return AttendanceWidget(
            pageTitleWidth: 200,
            pageTitleTextSize: 18,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 14,
            dataTextSize: 14,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        }
      },
    );
  }
}
