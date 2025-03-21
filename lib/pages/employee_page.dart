import 'package:flutter/material.dart';
import 'package:hr_veract/Screen_Type/Desktop/employee_desktop.dart';
import 'package:hr_veract/Screen_Type/Mobile/employee_mobile.dart';
import 'package:hr_veract/Screen_Type/Tablet/employee_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  Employees createState() => Employees();
}

class Employees extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return EmployeesPageMobile();
        } else if (sizingInformation.deviceScreenType ==
            DeviceScreenType.tablet) {
          return EmployeesPageTablet();
        } else {
          return EmployeesPageDesktop();
        }
      },
    );
  }
}
