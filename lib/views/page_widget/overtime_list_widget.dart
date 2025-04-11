import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/views/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/src/features/profile/ui/custom_appbar_menu.dart';
import 'package:hr_veract/views/custom_widgets/custom_button.dart';
import 'package:hr_veract/views/custom_widgets/custom_nav_bar.dart';
import 'package:hr_veract/views/custom_widgets/custom_paginated_table.dart';
import 'package:hr_veract/views/custom_widgets/custom_popup_dialog.dart';
import 'package:hr_veract/views/custom_widgets/custom_search_bar.dart';

class OvertimeListWidget extends StatefulWidget {
  final double screenWidth;
  final double headerTextSize;
  final double dataTextSize;
  final double searchBarWidth;
  final double searchBarTextSize;
  final double pageTitleTextSize;
  final double buttonHeight;
  final double navTextSize;
  final double buttonWidth;

  const OvertimeListWidget({
    super.key,
    required this.screenWidth,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.searchBarWidth,
    required this.searchBarTextSize,
    required this.pageTitleTextSize,
    required this.buttonHeight,
    required this.navTextSize,
    required this.buttonWidth,
  });

  @override
  State<OvertimeListWidget> createState() => _OvertimeListWidgetState();
}

class _OvertimeListWidgetState extends State<OvertimeListWidget> {
  int? page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(appBarTitle: 'Overtime List'),
      drawer: CustomAppbarDrawer(),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/overtimeForm');
                          },
                          buttonText: 'File OT',
                          buttonHeight: widget.buttonHeight,
                          buttonWidth: widget.buttonWidth,
                          buttonTextSize: widget.searchBarTextSize,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSearchBar(
                        height: 30,
                        width: widget.searchBarWidth,
                        textSize: widget.searchBarTextSize,
                        horizontalPadding: 15,
                        verticalPadding: 6,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 30,
                    child: CustomNavBar(
                      navTextSize: widget.navTextSize,
                      navTitle: ['Personal OT', 'Handled OT Request'],
                      pageIndex: (pageIndex) {
                        setState(() {
                          page = pageIndex;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomPaginatedTable(
                    tableHeight: 0.65,
                    columns: [
                      DataColumn2(
                        size: ColumnSize.L,
                        label: SizedBox(
                          child: Text(
                            "DATE",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      DataColumn2(
                        size: ColumnSize.L,
                        label: SizedBox(
                          child: Text(
                            "EMPLOYEE",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      DataColumn2(
                        size: ColumnSize.S,
                        label: SizedBox(
                          child: Text(
                            "DURATION",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                    dataSource:
                        page == 1 ? _PersonalOT(context) : _handledOT(context),
                    headerTextSize: widget.headerTextSize,
                    dataTextSize: widget.dataTextSize,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalOT extends DataTableSource {
  final BuildContext context;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "TASK": "Mar $index, 2025",
      "EMPLOYEE": "John, Doe",
      "DURATION": "4",
    },
  );

  _PersonalOT(this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final row = _data[index];
    return DataRow(
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          _showPopup(context);
        }
      },
      cells: [
        DataCell(Text(row["TASK"]!)),
        DataCell(Text(row["EMPLOYEE"]!)),
        DataCell(Text(row["DURATION"]!)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
}

class _handledOT extends DataTableSource {
  final BuildContext context;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "TASK": "Feb $index, 2025",
      "EMPLOYEE": "Jane, Doe",
      "DURATION": "2",
    },
  );

  _handledOT(this.context);

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final row = _data[index];
    return DataRow(
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          _showPopup(context);
        }
      },
      cells: [
        DataCell(Text(row["TASK"]!)),
        DataCell(Text(row["EMPLOYEE"]!)),
        DataCell(Text(row["DURATION"]!)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
}

void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomPopupDialog(
        contents: [
          SizedBox(height: 5),
          Text(
            "Employee:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "John Doe",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Date:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "March 1, 2025",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Duration:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "4",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Rate:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "1000",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "HR:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "IT Administrator",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Status:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "HR Approved",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          // SizedBox(height: 15),
          // Center(
          //   child: CustomButton(
          //     onPressed: () {
          //       print('pressed');
          //     },
          //     buttonText: 'Download',
          //     buttonHeight: 25,
          //     buttonWidth: 100,
          //     buttonTextSize: 12,
          //   ),
          // ),
        ],
      );
    },
  );
}
