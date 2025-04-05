import 'package:flutter/material.dart';
import 'package:hr_veract/views/page_widget/paycheck_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaycheckPage extends StatefulWidget {
  const PaycheckPage({super.key});

  @override
  State<PaycheckPage> createState() => _PaycheckPageState();
}

class _PaycheckPageState extends State<PaycheckPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return PaycheckWidget(
            pageTitleWidth: 120,
            pageTitleTextSize: 14,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        } else {
          return PaycheckWidget(
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
