import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:hr_veract/custom_widgets/custom_search_bar.dart';
import 'package:data_table_2/data_table_2.dart';

class EmployeesPageWidget extends StatefulWidget {
  final double searchBoxWidth;
  final double searchBoxTextSize;
  final double headerTextSize;
  final double dataTextSize;
  final DataTableSource dataTableSource;

  const EmployeesPageWidget({
    super.key,
    required this.searchBoxWidth,
    required this.searchBoxTextSize,
    required this.dataTableSource,
    required this.headerTextSize,
    required this.dataTextSize,
  });

  @override
  Employees createState() => Employees();
}

class Employees extends State<EmployeesPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: LayoutBuilder(
          builder:
              (context, constraints) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Text(
                              'All Employees',
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          Flexible(
                            child: CustomSearchBar(
                              width: widget.searchBoxWidth,
                              textSize: widget.searchBoxTextSize,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              width: 700,
                              height: 630,
                              padding: EdgeInsets.only(bottom: 50),
                              child: PaginatedDataTable2(
                                showCheckboxColumn: false,
                                headingRowColor: WidgetStateColor.resolveWith(
                                  (states) => Color.fromRGBO(106, 159, 106, 1),
                                ),
                                headingRowHeight: 60,
                                dataRowHeight: 50,
                                rowsPerPage: 9,
                                columns: [
                                  DataColumn(label: Text("Name")),
                                  DataColumn(label: Text("Position")),
                                ],
                                source: widget.dataTableSource,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employees');
        },
        backgroundColor: Color.fromRGBO(106, 159, 106, 1),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
