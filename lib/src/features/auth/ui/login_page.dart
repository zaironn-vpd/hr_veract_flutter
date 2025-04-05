import 'package:flutter/material.dart';
import 'package:hr_veract/views/custom_widgets/custom_button.dart';
import 'package:hr_veract/views/custom_widgets/custom_input_field.dart';
import 'package:hr_veract/views/custom_widgets/custom_input_field_obscure.dart';

class UserLoginPage extends StatelessWidget {
  const UserLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 236, 239, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VeraCT',
              style: TextStyle(
                letterSpacing: 5,
                fontSize: 64.0,
                color: Color.fromRGBO(44, 62, 80, 1),
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
              ),
            ),
            InputField(
              textFieldWidth: 300,
              textHint: "User Name",
              textSize: 16,
            ),
            SizedBox(height: 20),
            InputFieldObscure(),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              buttonHeight: 35,
              buttonText: "Login",
              buttonTextSize: 14,
              buttonWidth: 135,
            ),
          ],
        ),
      ),
    );
  }
}
