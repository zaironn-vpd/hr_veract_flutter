import 'package:flutter/material.dart';
import 'package:hr_veract/page_widget/files_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return FilesWidget(
            pageTitleWidth: 120,
            pageTitleTextSize: 14,
            screenWidth: MediaQuery.of(context).size.width,
            headerTextSize: 11,
            dataTextSize: 11,
            searchBarTextSize: 11,
            searchBarWidth: MediaQuery.of(context).size.width * .8,
          );
        } else {
          return FilesWidget(
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
