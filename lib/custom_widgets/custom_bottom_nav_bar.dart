import 'package:flutter/material.dart';
import 'package:hr_veract/pages/dashboard.dart';
import 'package:hr_veract/pages/employee_page.dart';

class BottomNavigation extends StatefulWidget {
  final int selectedIndex;

  const BottomNavigation({super.key, required this.selectedIndex});

  @override
  BottomNavBar createState() => BottomNavBar();
}

class BottomNavBar extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        if (ModalRoute.of(context)?.settings.name != '/dashboard') {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
        break;
      case 1:
        if (ModalRoute.of(context)?.settings.name != '/employees') {
          Navigator.pushReplacementNamed(context, '/employees');
        }
        break;
      case 2:
        print("Recruitment tapped");
        break;
      case 3:
        print("Menu tapped");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(106, 159, 106, 1),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color.fromRGBO(233, 236, 239, 0.6),
      selectedLabelStyle: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'PoppinsRegular',
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.space_dashboard_rounded),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Employees'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Recruitment'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ],
    );
  }
}
