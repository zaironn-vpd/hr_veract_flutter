import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final double containerWidth;
  const DatePicker({super.key, required this.containerWidth});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate; // Store the selected date

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Default to today
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        width: widget.containerWidth,
        height: 30,
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
                alignment: Alignment.center,
                child: Text(
                  selectedDate == null
                      ? "dd/mm/yyyy"
                      : DateFormat('dd-MM-yyyy').format(selectedDate!),
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
              child: Icon(Icons.calendar_month_rounded, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
