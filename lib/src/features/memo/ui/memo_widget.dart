import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/repository/token_repository.dart';
import 'package:hr_veract/src/features/memo/domain/memo.dart';
import 'package:hr_veract/src/features/memo/repository/memo_repository.dart';
import 'package:hr_veract/views/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/src/features/profile/ui/custom_appbar_menu.dart';
import 'package:hr_veract/views/custom_widgets/custom_button.dart';
import 'package:hr_veract/views/custom_widgets/custom_paginated_table.dart';
import 'package:hr_veract/views/custom_widgets/custom_popup_dialog.dart';
import 'package:hr_veract/views/custom_widgets/custom_search_bar.dart';

class MemoWidget extends ConsumerStatefulWidget {
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
  ConsumerState<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends ConsumerState<MemoWidget> {
  @override
  Widget build(BuildContext context) {
    final tokenRepo = ref.watch(tokenRepositoryProvider);

    return FutureBuilder<bool>(
      future: tokenRepo.isTokenValid(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final isValid = snapshot.data!;
        if (!isValid) {
          tokenRepo.clearToken();
          Future.microtask(() => Navigator.pushReplacementNamed(context, '/'));
        }

        return ref
            .watch(memoRepositoryProvider)
            .when(
              data: (data) {
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
                                        "SUBJECT",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    size: ColumnSize.M,
                                    label: SizedBox(
                                      child: Text(
                                        "STATUS",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                                dataSource: _MyDataSource(context, data),
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
              },
              loading:
                  () => const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ), // actual loading handled in dialog
              error:
                  (e, st) => Scaffold(
                    body: Center(
                      child: Text(
                        e.toString(),
                        style: TextStyle(
                          fontFamily: 'PoppinsRegular',
                          fontSize: 14,
                          letterSpacing: 2,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
            );
      },
    );
  }
}

class _MyDataSource extends DataTableSource {
  final BuildContext context;
  final List<Memo> memos;

  // final List<Map<String, String>> _data = List.generate(
  //   50,
  //   (index) => {
  //     "DATE": "March $index, 2025",
  //     "SUBJECT": "Employee Wellness",
  //     "STATUS": "Released",
  //   },
  // );

  _MyDataSource(this.context, this.memos);

  @override
  DataRow? getRow(int index) {
    final file = memos[index];
    return DataRow(
      onSelectChanged: (selected) {
        if (selected != null && selected) {
          _showPopup(context);
        }
      },
      cells: [
        DataCell(Text(file.date)),
        DataCell(Text(file.subject)),
        DataCell(Text(file.status)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => memos.length;
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
            "Subject:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "Employee Wellness",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Category:",
            style: TextStyle(
              fontFamily: "PoppinsBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          Text(
            "general",
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
            "Released",
            style: TextStyle(
              fontFamily: "PoppinsRegular",
              letterSpacing: 2,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: CustomButton(
              onPressed: () {
                print('pressed');
              },
              buttonText: 'Download',
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
