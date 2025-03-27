import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_menu.dart';
import 'package:hr_veract/custom_widgets/custom_chart.dart';
import 'package:hr_veract/custom_widgets/custom_container_with_header.dart';
import 'package:hr_veract/custom_widgets/custom_dashboard_container.dart';
import 'package:intl/intl.dart';

class EmployeeTaskWidget extends StatefulWidget {
  final double screenWidth;
  final double attendanceChartWidth;
  final double containerWidth;
  final double titleTextSize;
  final double valueTextSize;
  final double gap;

  const EmployeeTaskWidget({
    super.key,
    required this.screenWidth,
    required this.attendanceChartWidth,
    required this.containerWidth,
    required this.titleTextSize,
    required this.valueTextSize,
    required this.gap,
  });

  @override
  State<EmployeeTaskWidget> createState() => _EmployeeTaskWidgetState();
}

class _EmployeeTaskWidgetState extends State<EmployeeTaskWidget> {
  late Timer _timer;
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _updateTime(),
    );
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('hh:mm:ss a').format(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('EEE, MMM d, yyyy').format(now);

    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(appBarTitle: 'Task'),
      drawer: CustomAppbarDrawer(),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Welcome John Doe,',
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              _currentTime,
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CustomDashboardContainer(
                          containerText: 'Total Points',
                          containerValue: '5',
                          containerWidth: widget.containerWidth,
                          titleTextSize: widget.titleTextSize,
                          valueTextSize: widget.valueTextSize,
                          containerHeight: 90,
                          titleTextColor: Colors.black,
                        ),
                        SizedBox(width: 10),
                        CustomDashboardContainer(
                          containerText: 'For Reviewing Task',
                          containerValue: '5',
                          containerWidth: widget.containerWidth,
                          titleTextSize: widget.titleTextSize,
                          valueTextSize: widget.valueTextSize,
                          containerHeight: 90,
                          gap: widget.gap,
                          titleTextColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CustomDashboardContainer(
                          containerText: 'Pending Tasks',
                          containerValue: '5',
                          containerWidth: widget.containerWidth,
                          titleTextSize: widget.titleTextSize,
                          valueTextSize: widget.valueTextSize,
                          containerHeight: 90,
                          titleTextColor: Colors.black,
                        ),
                        SizedBox(width: 10),
                        CustomDashboardContainer(
                          containerText: 'Completed Tasks',
                          containerValue: '5',
                          containerWidth: widget.containerWidth,
                          titleTextSize: widget.titleTextSize,
                          valueTextSize: widget.valueTextSize,
                          containerHeight: 90,
                          gap: widget.gap,
                          titleTextColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomContainerWithHeader(
                      containerHeight: 220,
                      containerTitle: 'My Latest Task',
                      containerWidth: widget.attendanceChartWidth,
                    ),
                    SizedBox(height: 10),
                    CustomContainerWithHeader(
                      containerHeight: 220,
                      containerTitle: 'Task Point Champion',
                      containerWidth: widget.attendanceChartWidth,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: widget.attendanceChartWidth,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 249, 250, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CustomChart(
                        chartTitle: "My Task Analysis",
                        bottomTitleWidgets: ['JAN', 'FEB', 'MAR'],
                        leftTitleWidgets: ['0.5', '1', '1.5'],
                        lineChartBarData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 3),
                              FlSpot(2.6, 2),
                              FlSpot(4.9, 5),
                              FlSpot(6.8, 3.1),
                              FlSpot(8, 4),
                              FlSpot(9.5, 3),
                              FlSpot(11, 4),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.blue.withOpacity(0.7),
                            ),
                          ),

                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 2),
                              FlSpot(2.6, 3.5),
                              FlSpot(4.9, 2),
                              FlSpot(6.8, 4),
                              FlSpot(8, 3),
                              FlSpot(9.5, 4.5),
                              FlSpot(11, 2.5),
                            ],
                            isCurved: true,
                            color: Colors.amber,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.amber.withOpacity(0.7),
                            ),
                          ),

                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 4),
                              FlSpot(2.6, 3),
                              FlSpot(4.9, 3.5),
                              FlSpot(6.8, 2),
                              FlSpot(8, 4.5),
                              FlSpot(9.5, 5),
                              FlSpot(11, 3),
                            ],
                            isCurved: true,
                            color: Colors.green,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.green.withOpacity(0.7),
                            ),
                          ),
                        ],
                        chartLegends: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Reviewing",
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.amber[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Pending",
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Complete",
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
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
