import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/contribution_history_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContributionHistoryPage extends StatefulWidget {
  const ContributionHistoryPage({super.key});

  @override
  State<ContributionHistoryPage> createState() =>
      _ContributionHistoryPageState();
}

class _ContributionHistoryPageState extends State<ContributionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return ContributionHistoryWidget(
            pageTitleWidth: 120,
            pageTitleTextSize: 14,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .5,
          );
        } else {
          return ContributionHistoryWidget(
            pageTitleWidth: 200,
            pageTitleTextSize: 18,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 14,
            dataTextSize: 14,
            searchBarTextSize: 14,
            searchBarWidth: MediaQuery.of(context).size.width * .5,
          );
        }
      },
    );
  }
}
