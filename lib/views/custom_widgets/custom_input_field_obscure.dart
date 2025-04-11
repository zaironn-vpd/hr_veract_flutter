import 'package:flutter/material.dart';

class InputFieldObscure extends StatefulWidget {
  final TextEditingController? controller;

  const InputFieldObscure({super.key, this.controller});

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<InputFieldObscure> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
          color: Color.fromRGBO(44, 62, 80, 1),
          letterSpacing: 2,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(248, 249, 250, 1),
          hintText: 'Password',
          hintStyle: TextStyle(
            fontFamily: 'PoppinsRegular',
            color: Color.fromRGBO(108, 117, 125, 1),
            letterSpacing: 2,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            color: Color.fromRGBO(44, 62, 80, 1),
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
