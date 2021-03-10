import 'package:doctor/screens/bottomnavbar/appointment.dart';
import 'package:doctor/screens/bottomnavbar/homepage.dart';
import 'package:doctor/screens/bottomnavbar/profile.dart';
import 'package:flutter/material.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

List screens = [HomePage(), Appointment(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Appointment'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profiel'),
          ),
        ],
        selectedItemColor: Color(0xff00BBDC),
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current]
    );
  }
}