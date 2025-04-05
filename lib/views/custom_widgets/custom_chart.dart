import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatefulWidget {
  final String chartTitle;
  final List<LineChartBarData> lineChartBarData;
  final Row chartLegends;
  final List<String> leftTitleWidgets;
  final List<String> bottomTitleWidgets;

  const CustomChart({
    super.key,
    required this.chartTitle,
    required this.lineChartBarData,
    required this.chartLegends,
    required this.leftTitleWidgets,
    required this.bottomTitleWidgets,
  });

  @override
  State<CustomChart> createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 40,
                  bottom: 10,
                ),
                child: LineChart(mainData()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: SizedBox(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.chartTitle,
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: widget.chartLegends,
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontFamily: 'PoppinsBold',
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text(widget.bottomTitleWidgets[0], style: style);
        break;
      case 5:
        text = Text(widget.bottomTitleWidgets[1], style: style);
        break;
      case 8:
        text = Text(widget.bottomTitleWidgets[2], style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(meta: meta, child: text);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontFamily: 'PoppinsBold',
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = widget.leftTitleWidgets[0];
        break;
      case 3:
        text = widget.leftTitleWidgets[1];
        break;
      case 5:
        text = widget.leftTitleWidgets[2];
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(color: Colors.black, strokeWidth: 0.5);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromRGBO(248, 249, 250, 1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 20,
          ),
        ),
      ),

      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: widget.lineChartBarData,
    );
  }
}
