import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar.dart';
import 'package:hr_veract/custom_widgets/custom_button.dart';
import 'package:hr_veract/custom_widgets/custom_datepicker.dart';
import 'package:hr_veract/custom_widgets/custom_dropdown_textbox.dart';
import 'package:hr_veract/custom_widgets/custom_input_field.dart';

class LeaveFormWidget extends StatefulWidget {
  final double screenWidth;
  final double containerSize;
  final double reasonTextWidth;
  const LeaveFormWidget({
    super.key,
    required this.screenWidth,
    required this.containerSize,
    required this.reasonTextWidth,
  });

  @override
  State<LeaveFormWidget> createState() => _LeaveFormWidgetState();
}

class _LeaveFormWidgetState extends State<LeaveFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbar(title: 'Leave Form', textSize: 16),
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
                        'File Leave',
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
                    'Type of Leave',
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  CustomDropdownTextbox(
                    containerWidth: widget.reasonTextWidth,
                    hintText: "Select a Leave Type",
                    items: [
                      "Leave of Abscence",
                      "Sick Leave",
                      "Vacation Leave",
                      "Emergency Leave",
                      "Birthday Leave",
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Payment',
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  CustomDropdownTextbox(
                    containerWidth: widget.reasonTextWidth,
                    hintText: "Select Payment",
                    items: ["With Pay", "Without Pay"],
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
                            textHint: 'LV25-00001',
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
                            'Date to be taken',
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                          DatePicker(containerWidth: widget.containerSize),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Reason for Leave Request',
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  InputField(
                    maxLines: 50,
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
                        onPressed: () {},
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
