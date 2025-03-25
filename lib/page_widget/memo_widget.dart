import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_menu.dart';
import 'package:hr_veract/custom_widgets/custom_search_bar.dart';

class MemoWidget extends StatefulWidget {
  final double screenWidth;
  final double headerTextSize;
  final double dataTextSize;
  final double searchBarWidth;
  final double searchBarTextSize;
  final double pageTitleTextSize;

  const MemoWidget({
    super.key,
    required this.screenWidth,
    required this.headerTextSize,
    required this.dataTextSize,
    required this.searchBarWidth,
    required this.searchBarTextSize,
    required this.pageTitleTextSize,
  });

  @override
  State<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(),
      drawer: CustomAppbarDrawer(),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: widget.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Memo Page',
                          style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontWeight: FontWeight.bold,
                            fontSize: widget.pageTitleTextSize,
                            letterSpacing: 2,
                          ),
                        ),
                        CustomSearchBar(
                          width: widget.searchBarWidth,
                          textSize: widget.searchBarTextSize,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 700,
                      height: 620,
                      child: PaginatedDataTable2(
                        showCheckboxColumn: false,
                        headingRowColor: WidgetStateColor.resolveWith(
                          (states) => Color.fromRGBO(106, 159, 106, 1),
                        ),
                        headingRowHeight: 50,
                        dataRowHeight: 50,
                        rowsPerPage: 10,
                        columnSpacing: 15,
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
                                "SUBJECT",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          DataColumn2(
                            size: ColumnSize.L,
                            label: SizedBox(
                              child: Text(
                                "CATEGORY",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          // DataColumn2(
                          //   size: ColumnSize.M,
                          //   label: SizedBox(
                          //     child: Text(
                          //       "STATUS",
                          //       overflow: TextOverflow.visible,
                          //       textAlign: TextAlign.left,
                          //     ),
                          //   ),
                          // ),
                        ],
                        source: _MyDataSource(context),
                        headingTextStyle: TextStyle(
                          fontFamily: "PoppinsBold",
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: widget.headerTextSize,
                          color: Color.fromRGBO(44, 62, 80, 1),
                        ),
                        dataTextStyle: TextStyle(
                          fontFamily: "PoppinsRegular",
                          letterSpacing: 2,
                          fontSize: widget.dataTextSize,
                          color: Color.fromRGBO(44, 62, 80, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
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
  // final double headerTextSize;
  // final double dataTextSize;
  // final double containerWidth;
  // final double dataCellWidth;

  final List<Map<String, String>> _data = List.generate(
    50,
    (index) => {
      "DATE": "March $index, 2025",
      "SUBJECT": "Developer",
      "CATEGORY": "Developer",
      "STATUS": "Released",
    },
  );

  _MyDataSource(
    this.context,
    // this.headerTextSize,
    // this.dataTextSize,
    // this.containerWidth,
    // this.dataCellWidth,
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final row = _data[index];
    return DataRow(
      // onSelectChanged: (selected) {
      //   if (selected != null && selected) {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder:
      //             (context) => EmployeesProfileWidget(
      //               // employeeCode: "${_data[index]['code']}",
      //               containerWidth: containerWidth,
      //               dataTextSize: dataTextSize,
      //               headerTextSize: headerTextSize,
      //               dataCellWidth: dataCellWidth,
      //               dataCellWidthLeft: 2,
      //             ),
      //       ),
      //     );
      //   }
      // },
      cells: [
        DataCell(Text(row["DATE"]!)),
        DataCell(Text(row["SUBJECT"]!)),
        DataCell(Text(row["CATEGORY"]!)),
        // DataCell(Text(row["STATUS"]!)),
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
