import 'package:flutter/material.dart';
import 'package:hr_veract/views/page_widget/dashboard_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  State<Dashboardpage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return DashboardWidget(
            screenWidth: 280,
            containerWidth: 135,
            titleTextSize: 12,
            valueTextSize: 10,
            buttonWidth: 135,
            buttonTextSize: 10,
            attendanceChartWidth: 275,
          );
        } else {
          return DashboardWidget(
            screenWidth: 510,
            containerWidth: 250,
            titleTextSize: 14,
            valueTextSize: 12,
            buttonWidth: 250,
            buttonTextSize: 12,
            attendanceChartWidth: 510,
          );
        }
      },
    );
  }
}
