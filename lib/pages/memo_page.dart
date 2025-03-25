import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/memo_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({super.key});

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MemoWidget(
            pageTitleTextSize: 12,
            screenWidth: 280,
            headerTextSize: 8,
            dataTextSize: 7,
            searchBarTextSize: 8,
            searchBarWidth: 135,
          );
        } else {
          return MemoWidget(
            pageTitleTextSize: 16,
            screenWidth: 510,
            headerTextSize: 10,
            dataTextSize: 10,
            searchBarTextSize: 12,
            searchBarWidth: 300,
          );
        }
      },
    );
  }
}
