import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/leave_list_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LeaveListPage extends StatefulWidget {
  const LeaveListPage({super.key});

  @override
  State<LeaveListPage> createState() => _LeaveListPageState();
}

class _LeaveListPageState extends State<LeaveListPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return LeaveListWidget(
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
          return LeaveListWidget(
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
