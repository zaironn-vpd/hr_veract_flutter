import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar.dart';
import 'package:hr_veract/custom_widgets/custom_button.dart';
import 'package:hr_veract/custom_widgets/custom_input_field.dart';

class OvertimeFormWidget extends StatefulWidget {
  final double screenSize;
  final double containerSize;

  const OvertimeFormWidget({
    super.key,
    required this.screenSize,
    required this.containerSize,
  });

  @override
  State<OvertimeFormWidget> createState() => _OvertimeFormWidgetState();
}

class _OvertimeFormWidgetState extends State<OvertimeFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbar(title: 'OT Form', textSize: 16),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.screenSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Overtime Date',
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),
                  InputField(
                    textFieldWidth: widget.containerSize,
                    textFieldHeight: 30,
                    textSize: 11,
                    textHint: 'Overtime Date',
                    borderRadius: 8,
                    verticalPadding: 0,
                    horizontalPadding: 10,
                  ),
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
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                          ),
                          InputField(
                            textFieldWidth: widget.containerSize,
                            textFieldHeight: 30,
                            textSize: 11,
                            textHint: 'Time in',
                            borderRadius: 8,
                            verticalPadding: 0,
                            horizontalPadding: 10,
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
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                          ),
                          InputField(
                            textFieldWidth: widget.containerSize,
                            textFieldHeight: 30,
                            textSize: 11,
                            textHint: 'Time out',
                            borderRadius: 8,
                            verticalPadding: 0,
                            horizontalPadding: 10,
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
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                          ),
                          InputField(
                            textFieldWidth: widget.containerSize,
                            textFieldHeight: 30,
                            textSize: 11,
                            textHint: 'OT25-00001',
                            borderRadius: 8,
                            verticalPadding: 0,
                            horizontalPadding: 10,
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
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                          ),
                          InputField(
                            textFieldWidth: widget.containerSize,
                            textFieldHeight: 30,
                            textSize: 11,
                            borderRadius: 8,
                            verticalPadding: 0,
                            horizontalPadding: 10,
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
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),
                  InputField(
                    textFieldWidth: 280,
                    textFieldHeight: 50,
                    textSize: 11,
                    borderRadius: 8,
                    verticalPadding: 0,
                    horizontalPadding: 10,
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
