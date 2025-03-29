import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_menu.dart';
import 'package:hr_veract/custom_widgets/custom_button.dart';
import 'package:hr_veract/custom_widgets/custom_paginated_table.dart';
import 'package:hr_veract/custom_widgets/custom_popup_dialog.dart';
import 'package:hr_veract/custom_widgets/custom_search_bar.dart';

class PollVotingWidget extends StatefulWidget {
  final double screenWidth;
  final double headerTextSize;
  final double dataTextSize;
  final double searchBarWidth;
  final double searchBarTextSize;
  final double pageTitleTextSize;

  const PollVotingWidget({
    super.key,
    required this.screenWidth,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.searchBarWidth,
    required this.searchBarTextSize,
    required this.pageTitleTextSize,
  });

  @override
  State<PollVotingWidget> createState() => _PollVotingWidgetState();
}

class _PollVotingWidgetState extends State<PollVotingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(appBarTitle: 'Memo'),
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
                        size: ColumnSize.M,
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
                            "NAME",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: SizedBox(
                          child: Text(
                            "END",
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
      "DATE": "Mar $index, 2025",
      "NAME": "Food for Party",
      "END": "Apr $index, 2025",
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
        DataCell(Text(row["DATE"]!)),
        DataCell(Text(row["NAME"]!)),
        DataCell(Text(row["END"]!)),
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
  String selectedValue = "Option 1";
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomPopupDialog(
        contents: [
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
            "Name:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Food for Party",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Description:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Food",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Start:",
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
            "End:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Apr 1, 2025",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Column(
            children: [
              ListTile(
                title: Text("Option 1"),
                leading: Radio<String>(
                  value: "Option 1",
                  groupValue: selectedValue,
                  onChanged: (value) {
                    selectedValue = value!;
                  },
                ),
              ),
              ListTile(
                title: Text("Option 2"),
                leading: Radio<String>(
                  value: "Option 2",
                  groupValue: selectedValue,
                  onChanged: (value) {
                    selectedValue = value!;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Center(
            child: CustomButton(
              onPressed: () {
                print('pressed');
              },
              buttonText: 'Submit',
              buttonHeight: 25,
              buttonWidth: 100,
              buttonTextSize: 12,
            ),
          ),
        ],
      );
    },
  );
}
