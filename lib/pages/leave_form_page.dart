import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/leave_form_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeaveFormPage extends StatefulWidget {
  const LeaveFormPage({super.key});

  @override
  State<LeaveFormPage> createState() => _LeaveFormPageState();
}

class _LeaveFormPageState extends State<LeaveFormPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return LeaveFormWidget(
            containerSize: 135,
            screenWidth: 280,
            reasonTextWidth: 280,
          );
        } else {
          return LeaveFormWidget(
            containerSize: 250,
            screenWidth: 510,
            reasonTextWidth: 510,
          );
        }
      },
    );
  }
}
