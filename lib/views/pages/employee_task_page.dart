import 'package:flutter/material.dart';
import 'package:hr_veract/views/page_widget/employee_task_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmployeeTaskPage extends StatefulWidget {
  const EmployeeTaskPage({super.key});

  @override
  State<EmployeeTaskPage> createState() => _EmployeeTaskPageState();
}

class _EmployeeTaskPageState extends State<EmployeeTaskPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return EmployeeTaskWidget(
            screenWidth: 320,
            attendanceChartWidth: 280,
            containerWidth: 135,
            titleTextSize: 12,
            valueTextSize: 10,
            gap: 9,
          );
        } else {
          return EmployeeTaskWidget(
            screenWidth: 550,
            containerWidth: 250,
            titleTextSize: 14,
            valueTextSize: 12,
            attendanceChartWidth: 510,
            gap: 25,
          );
        }
      },
    );
  }
}
