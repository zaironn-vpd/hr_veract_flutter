import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/overtime_form_widget.dart';
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
            screenSize: MediaQuery.of(context).size.width,
          );
        } else {
          return OvertimeFormWidget(
            containerSize: 250,
            screenSize: MediaQuery.of(context).size.width,
          );
        }
      },
    );
  }
}
