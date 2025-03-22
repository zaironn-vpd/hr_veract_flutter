import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/dashboard_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dashboardpage extends StatefulWidget {
  const Dashboardpage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboardpage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return DashboardWidget(
            containerWidth: 135,
            titleTextSize: 12,
            valueTextSize: 10,
            buttonWidth: 135,
            buttonTextSize: 12,
          );
        } else {
          return DashboardWidget(
            containerWidth: 250,
            titleTextSize: 14,
            valueTextSize: 12,
            buttonWidth: 250,
            buttonTextSize: 14,
          );
        }
      },
    );
  }
}
