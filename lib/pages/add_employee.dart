import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/add_employee_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  _AddEmployeePage createState() => _AddEmployeePage();
}

class _AddEmployeePage extends State<AddEmployee> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return AddEmployeeWidget();
        } else {
          return AddEmployeeWidget();
        }
      },
    );
  }
}
