import 'package:flutter/material.dart';
import 'package:hr_veract/views/page_widget/overtime_form_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OvertimeFormPage extends StatefulWidget {
  const OvertimeFormPage({super.key});

  @override
  State<OvertimeFormPage> createState() => _OvertimeFormPageState();
}

class _OvertimeFormPageState extends State<OvertimeFormPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return OvertimeFormWidget(
            containerSize: 135,
            screenWidth: 280,
            reasonTextWidth: 280,
          );
        } else {
          return OvertimeFormWidget(
            containerSize: 250,
            screenWidth: 510,
            reasonTextWidth: 510,
          );
        }
      },
    );
  }
}
