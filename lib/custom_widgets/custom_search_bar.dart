import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  SearchBar createState() => SearchBar();
}

class SearchBar extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
          color: Color.fromRGBO(44, 62, 80, 1),
          letterSpacing: 2,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(248, 249, 250, 1),
          hintText: 'Search',
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
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
