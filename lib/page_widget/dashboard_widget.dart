import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_drawer.dart';
import 'package:hr_veract/custom_widgets/custom_appbar_menu.dart';
import 'package:hr_veract/custom_widgets/custom_button.dart';
import 'package:hr_veract/custom_widgets/custom_chart.dart';
import 'package:hr_veract/custom_widgets/custom_dashboard_container.dart';

class DashboardWidget extends StatefulWidget {
  final double containerWidth;
  final double titleTextSize;
  final double valueTextSize;
  final double buttonWidth;
  final double buttonTextSize;
  final double attendanceChartWidth;
  final double screenWidth;

  const DashboardWidget({
    super.key,
    required this.containerWidth,
    required this.titleTextSize,
    required this.valueTextSize,
    required this.buttonWidth,
    required this.buttonTextSize,
    required this.attendanceChartWidth,
    required this.screenWidth,
  });

  @override
  DashboardWidgetState createState() => DashboardWidgetState();
}

class DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbarMenu(appBarTitle: 'VeraCT'),
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
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(),
                    Text(
                      'Salary',
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomDashboardContainer(
                          containerWidth: widget.containerWidth,
                          containerHeight: 100,
                          containerText: 'Monthly Rating',
                          containerValue: '18,000',
                          valueTextSize: widget.valueTextSize,
                          titleTextSize: widget.titleTextSize,
                          titleTextColor: Colors.green[300],
                        ),
                        CustomDashboardContainer(
                          containerWidth: widget.containerWidth,
                          containerHeight: 100,
                          containerText: 'Deduction',
                          containerValue: '18,000',
                          valueTextSize: widget.valueTextSize,
                          titleTextSize: widget.titleTextSize,
                          titleTextColor: Colors.red[300],
                        ),
                      ],
                    ),
                    SizedBox(),
                    Text(
                      'Attendance',
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomDashboardContainer(
                          containerWidth: widget.containerWidth,
                          containerHeight: 100,
                          containerText: 'On-time',
                          containerValue: '365',
                          valueTextSize: widget.valueTextSize,
                          titleTextSize: widget.titleTextSize,
                          titleTextColor: Colors.green[300],
                        ),
                        CustomDashboardContainer(
                          containerWidth: widget.containerWidth,
                          containerHeight: 100,
                          containerText: 'Late/s',
                          containerValue: '0',
                          valueTextSize: widget.valueTextSize,
                          titleTextSize: widget.titleTextSize,
                          titleTextColor: Colors.red[300],
                        ),
                      ],
                    ),
                    SizedBox(),
                    Text(
                      'Available Leave/s',
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomDashboardContainer(
                          containerWidth: widget.containerWidth,
                          containerHeight: 100,
                          containerText: 'Balance',
                          containerValue: '365',
                          valueTextSize: widget.valueTextSize,
                          titleTextSize: widget.titleTextSize,
                          titleTextColor: Colors.green[300],
                        ),
                        CustomDashboardContainer(
                          containerWidth: widget.containerWidth,
                          containerHeight: 100,
                          containerText: 'Used',
                          containerValue: '0',
                          valueTextSize: widget.valueTextSize,
                          titleTextSize: widget.titleTextSize,
                          titleTextColor: Colors.red[300],
                        ),
                      ],
                    ),
                    SizedBox(),
                    Text(
                      'Create Form',
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        CustomButton(
                          onPressed: () {},
                          buttonHeight: 50,
                          buttonText: "Overtime Form",
                          buttonWidth: widget.buttonWidth,
                          buttonTextSize: widget.buttonTextSize,
                        ),
                        CustomButton(
                          onPressed: () {},
                          buttonHeight: 50,
                          buttonText: "Leave Form",
                          buttonWidth: widget.buttonWidth,
                          buttonTextSize: widget.buttonTextSize,
                        ),
                      ],
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
                        chartTitle: "Attendance Chart",
                        bottomTitleWidgets: ['JAN', 'FEB', 'MAR'],
                        leftTitleWidgets: ['2', '4', '6'],
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
                            color: Color.fromRGBO(106, 159, 106, 1),
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Color.fromRGBO(
                                168,
                                221,
                                168,
                                1,
                              ).withOpacity(0.7),
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
                            color: Colors.blue,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.blue.withOpacity(0.7),
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
                                color: Colors.green[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "On-time",
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
                                color: Colors.blue[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Late",
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
                        chartTitle: "Contribution Chart",
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
                            color: Colors.green,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.green.withOpacity(0.7),
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
                              FlSpot(0, 1.5),
                              FlSpot(2.6, 2.5),
                              FlSpot(4.9, 3),
                              FlSpot(6.8, 4.5),
                              FlSpot(8, 2.5),
                              FlSpot(9.5, 3.5),
                              FlSpot(11, 4.2),
                            ],
                            isCurved: true,
                            color: Colors.red,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.red.withOpacity(0.7),
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
                              "SSS",
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "PAG-IBIG",
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.amber[300],
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "PHILHEALTH",
                              style: TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(color: Colors.red[300]),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Tax",
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
