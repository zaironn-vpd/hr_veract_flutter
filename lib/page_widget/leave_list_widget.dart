import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_menu.dart';
import 'package:hr_veract/custom_widgets/custom_button.dart';
import 'package:hr_veract/custom_widgets/custom_nav_bar.dart';
import 'package:hr_veract/custom_widgets/custom_paginated_table.dart';
import 'package:hr_veract/custom_widgets/custom_popup_dialog.dart';
import 'package:hr_veract/custom_widgets/custom_search_bar.dart';

class LeaveListWidget extends StatefulWidget {
  final double screenWidth;
  final double headerTextSize;
  final double dataTextSize;
  final double searchBarWidth;
  final double searchBarTextSize;
  final double pageTitleTextSize;
  final double buttonHeight;
  final double navTextSize;

  const LeaveListWidget({
    super.key,
    required this.screenWidth,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.searchBarWidth,
    required this.searchBarTextSize,
    required this.pageTitleTextSize,
    required this.buttonHeight,
    required this.navTextSize,
  });

  @override
  State<LeaveListWidget> createState() => _LeaveListWidgetState();
}

class _LeaveListWidgetState extends State<LeaveListWidget> {
  int? page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(appBarTitle: 'Leave List'),
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
                            Navigator.pushNamed(context, '/leaveForm');
                          },
                          buttonText: 'File Leave',
                          buttonHeight: widget.buttonHeight,
                          buttonWidth: 100,
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
                      navTitle: ['Personal Leave', 'Handled Leave Request'],
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
                        size: ColumnSize.S,
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
                        size: ColumnSize.L,
                        label: SizedBox(
                          child: Text(
                            "LEAVE TYPE",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                    dataSource:
                        page == 1
                            ? _PersonalLeave(context)
                            : _HandledLeave(context),
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

class _PersonalLeave extends DataTableSource {
  final BuildContext context;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "TASK": "Mar $index, 2025",
      "EMPLOYEE": "John, Doe",
      "LEAVETYPE": "Sick Leave",
    },
  );

  _PersonalLeave(this.context);

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
        DataCell(Text(row["LEAVETYPE"]!)),
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

class _HandledLeave extends DataTableSource {
  final BuildContext context;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "TASK": "Jan $index, 2025",
      "EMPLOYEE": "Jane, Doe",
      "LEAVETYPE": "Emergency Leave",
    },
  );

  _HandledLeave(this.context);

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
        DataCell(Text(row["LEAVETYPE"]!)),
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
            "Due Date:",
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
            "Leave Type:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Sick Leave",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Payment:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "With Pay",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "To be taken:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "March 55, 2025",
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
