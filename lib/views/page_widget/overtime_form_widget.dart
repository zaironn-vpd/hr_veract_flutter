import 'package:flutter/material.dart';
import 'package:hr_veract/views/custom_widgets/custom_appbar.dart';
import 'package:hr_veract/views/custom_widgets/custom_button.dart';
import 'package:hr_veract/views/custom_widgets/custom_datepicker.dart';
import 'package:hr_veract/views/custom_widgets/custom_input_field.dart';
import 'package:hr_veract/views/custom_widgets/custom_timepicker.dart';

class OvertimeFormWidget extends StatefulWidget {
  final double screenWidth;
  final double containerSize;
  final double reasonTextWidth;

  const OvertimeFormWidget({
    super.key,
    required this.screenWidth,
    required this.containerSize,
    required this.reasonTextWidth,
  });

  @override
  State<OvertimeFormWidget> createState() => _OvertimeFormWidgetState();
}

class _OvertimeFormWidgetState extends State<OvertimeFormWidget> {
  TimeOfDay? timeIn;
  TimeOfDay? timeOut;
  String durationText = "";

  void _calculateDuration() {
    if (timeIn != null && timeOut != null) {
      final int timeInMinutes = timeIn!.hour * 60 + timeIn!.minute;
      final int timeOutMinutes = timeOut!.hour * 60 + timeOut!.minute;
      final int durationMinutes = timeOutMinutes - timeInMinutes;

      if (durationMinutes < 0) {
        // Handle the case when time out is on the next day
        setState(() {
          durationText = "Invalid Time Selection";
        });
        return;
      }

      final int totalOT = durationMinutes - 540;
      final int hours = totalOT ~/ 60;
      final int minutes = totalOT % 60;

      setState(() {
        if (totalOT < 0) {
          durationText = "0";
        } else {
          durationText = "$hours hr $minutes min";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController timeDifference = TextEditingController(
      text: durationText,
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbar(title: 'OT Form', textSize: 16),
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
                  Center(
                    child: SizedBox(
                      child: Text(
                        'File Overtime',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PoppinsBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Overtime Date',
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  DatePicker(containerWidth: widget.containerSize),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time in',
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                          SpinnerTimePickerScreen(
                            containerWidth: widget.containerSize,
                            onTimeSelected: (selectedTime) {
                              setState(() {
                                timeIn = selectedTime;
                              });
                              _calculateDuration();
                            },
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time out',
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                          SpinnerTimePickerScreen(
                            containerWidth: widget.containerSize,
                            onTimeSelected: (selectedTime) {
                              setState(() {
                                timeOut = selectedTime;
                              });
                              _calculateDuration();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Serial',
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                          InputField(
                            enabled: true,
                            textFieldWidth: widget.containerSize,
                            textFieldHeight: 30,
                            textSize: 11,
                            textHint: 'OT25-00001',
                            borderRadius: 8,
                            verticalPadding: 0,
                            horizontalPadding: 10,
                            textColor: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overtime Hours',
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                          InputField(
                            controller: timeDifference,
                            //timeDifference: durationText,
                            enabled: true,
                            textFieldWidth: widget.containerSize,
                            textFieldHeight: 30,
                            textSize: 11,
                            borderRadius: 8,
                            verticalPadding: 0,
                            horizontalPadding: 10,
                            textColor: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Reason for overtime',
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  InputField(
                    maxLines: 6,
                    textFieldWidth: widget.reasonTextWidth,
                    textFieldHeight: 125,
                    textSize: 11,
                    borderRadius: 8,
                    verticalPadding: 15,
                    horizontalPadding: 15,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        buttonText: 'Cancel',
                        buttonHeight: 35,
                        buttonWidth: 100,
                        buttonTextSize: 14,
                        buttonCollor: Colors.grey.shade700,
                      ),
                      SizedBox(width: 10),
                      CustomButton(
                        onPressed: () {},
                        buttonText: 'Submit',
                        buttonHeight: 35,
                        buttonWidth: 100,
                        buttonTextSize: 14,
                      ),
                    ],
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
