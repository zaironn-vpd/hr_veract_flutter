import 'package:flutter/material.dart';
import 'package:hr_veract/views/page_widget/poll_voting_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PollVotingPage extends StatefulWidget {
  const PollVotingPage({super.key});

  @override
  State<PollVotingPage> createState() => _PollVotingPageState();
}

class _PollVotingPageState extends State<PollVotingPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return PollVotingWidget(
            pageTitleTextSize: 18,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        } else {
          return PollVotingWidget(
            pageTitleTextSize: 18,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 14,
            dataTextSize: 14,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        }
      },
    );
  }
}
