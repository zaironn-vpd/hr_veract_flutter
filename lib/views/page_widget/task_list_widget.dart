import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/views/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/src/features/profile/ui/custom_appbar_menu.dart';
import 'package:hr_veract/views/custom_widgets/custom_button.dart';
import 'package:hr_veract/views/custom_widgets/custom_paginated_table.dart';
import 'package:hr_veract/views/custom_widgets/custom_popup_dialog.dart';
import 'package:hr_veract/views/custom_widgets/custom_search_bar.dart';

class TaskListWidget extends StatefulWidget {
  final double screenWidth;
  final double headerTextSize;
  final double dataTextSize;
  final double searchBarWidth;
  final double searchBarTextSize;
  final double pageTitleTextSize;

  const TaskListWidget({
    super.key,
    required this.screenWidth,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.searchBarWidth,
    required this.searchBarTextSize,
    required this.pageTitleTextSize,
  });

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(appBarTitle: 'Task List'),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSearchBar(
                        width: widget.searchBarWidth,
                        textSize: widget.searchBarTextSize,
                        height: 30,
                        horizontalPadding: 15,
                        verticalPadding: 6,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomPaginatedTable(
                    columns: [
                      DataColumn2(
                        size: ColumnSize.L,
                        label: SizedBox(
                          child: Text(
                            "TASK",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      DataColumn2(
                        size: ColumnSize.L,
                        label: SizedBox(
                          child: Text(
                            "STATUS",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      DataColumn2(
                        size: ColumnSize.S,
                        label: SizedBox(
                          child: Text(
                            "POINTS",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                    dataSource: _MyDataSource(context),
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

class _MyDataSource extends DataTableSource {
  final BuildContext context;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "TASK": "Task $index",
      "STATUS": "Completed",
      "POINTS": "0$index",
    },
  );

  _MyDataSource(this.context);

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
        DataCell(Text(row["STATUS"]!)),
        DataCell(Text(row["POINTS"]!)),
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
            "Task:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Task 1",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Start Date:",
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
            "Status:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Completed",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Points:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "01",
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
