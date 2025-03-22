import 'package:flutter/material.dart';
import 'package:hr_veract/custom_widgets/custom_appbar.dart';
import 'package:hr_veract/custom_widgets/custom_input_field.dart';

class AddEmployeeWidget extends StatefulWidget {
  const AddEmployeeWidget({super.key});

  @override
  State<AddEmployeeWidget> createState() => _AddEmployeeWidgetState();
}

class _AddEmployeeWidgetState extends State<AddEmployeeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      appBar: CustomAppbar(title: "Add Employee", textSize: 18),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Personal Data',
                style: TextStyle(
                  fontFamily: 'PoppinsBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromRGBO(44, 62, 80, 1),
                ),
              ),
              InputField(
                textFieldWidth: 100,
                textHint: "First Name",
                textSize: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
