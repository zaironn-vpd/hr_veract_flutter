import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class SpinnerTimePickerScreen extends StatefulWidget {
  final double containerWidth;
  final Function(TimeOfDay) onTimeSelected;

  const SpinnerTimePickerScreen({
    super.key,
    required this.containerWidth,
    required this.onTimeSelected,
  });

  @override
  State<SpinnerTimePickerScreen> createState() =>
      _SpinnerTimePickerScreenState();
}

class _SpinnerTimePickerScreenState extends State<SpinnerTimePickerScreen> {
  TimeOfDay? selectedTime;

  void _showTimePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime tempTime = DateTime.now();

        return AlertDialog(
          title: Text(
            "Select Time",
            style: TextStyle(
              fontFamily: 'PoppinsBold',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 2,
            ),
          ),
          content: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false),
            child: TimePickerSpinner(
              is24HourMode: false,
              normalTextStyle: TextStyle(fontSize: 18, color: Colors.grey),
              highlightedTextStyle: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              spacing: 10,
              itemHeight: 40,
              isForce2Digits: true,
              onTimeChange: (time) {
                tempTime = time;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed:
                  () => Navigator.pop(context), // Close without selecting
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                  letterSpacing: 2,
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedTime = TimeOfDay(
                    hour: tempTime.hour,
                    minute: tempTime.minute,
                  );
                });

                widget.onTimeSelected(selectedTime!);
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: TextStyle(
                  fontFamily: 'PoppinsRegular',
                  letterSpacing: 2,
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showTimePickerDialog,
      child: Container(
        width: widget.containerWidth,
        height: 30,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 249, 250, 1),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedTime != null ? selectedTime!.format(context) : "",
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    letterSpacing: 2,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
              child: Icon(Icons.access_time_filled_rounded, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
