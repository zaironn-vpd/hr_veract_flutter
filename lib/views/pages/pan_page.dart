import 'package:flutter/material.dart';
import 'package:hr_veract/views/page_widget/pan_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PanPage extends StatefulWidget {
  const PanPage({super.key});

  @override
  State<PanPage> createState() => _PanPageState();
}

class _PanPageState extends State<PanPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return PanWidget(
            pageTitleWidth: 120,
            pageTitleTextSize: 14,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        } else {
          return PanWidget(
            pageTitleWidth: 200,
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
