import 'package:flutter/material.dart';
import 'package:hr_veract/src/features/profile/ui/employee_profile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return EmployeesProfileWidget(
            headerTextSize: 10,
            dataTextSize: 10,
            containerWidth: 500,
            dataCellWidth: 115,
            dataCellWidthLeft: 75,
          );
        } else {
          return EmployeesProfileWidget(
            headerTextSize: 12,
            dataTextSize: 12,
            containerWidth: 700,
            dataCellWidth: 250,
            dataCellWidthLeft: 125,
          );
        }
      },
    );
  }
}
