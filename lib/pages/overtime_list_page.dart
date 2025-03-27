import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/overtime_list_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OvertimeListPage extends StatefulWidget {
  const OvertimeListPage({super.key});

  @override
  State<OvertimeListPage> createState() => _OvertimeListPageState();
}

class _OvertimeListPageState extends State<OvertimeListPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return OvertimeListWidget(
            pageTitleTextSize: 14,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
            buttonHeight: 25,
            navTextSize: 10,
          );
        } else {
          return OvertimeListWidget(
            pageTitleTextSize: 16,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 14,
            dataTextSize: 14,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
            buttonHeight: 25,
            navTextSize: 12,
          );
        }
      },
    );
  }
}
