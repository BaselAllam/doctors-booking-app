import 'package:doctor/screens/bottomnavbar/appointment.dart';
import 'package:doctor/screens/bottomnavbar/homepage.dart';
import 'package:doctor/screens/bottomnavbar/profile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctor/models/categories/categoryController.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

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
      body: ScopedModelDescendant(
          builder: (context, child, CategoryController category) {
            if(current == 0){
              return HomePage(category);
            }else if(current == 1){
              return Appointment();
            }else{
              return Profile();
            }
          }
      )
    );
  }
}