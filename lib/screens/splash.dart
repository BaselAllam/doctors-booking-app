import 'package:doctor/screens/bottomnavbar/bottomnavbar.dart';
import 'package:doctor/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';



class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

String data;

@override
void initState() {
  checkData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: data == null ? SignIn() : BottomNavBar(),
      title: Text(
        'Welcome In Doctor',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.network(
          'https://mms.businesswire.com/media/20160202006046/en/507319/5/dod-logo-icon-large_%281%29.jpg'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
  checkData() async {
    try {
      SharedPreferences _user = await SharedPreferences.getInstance();
      String _data = _user.getString('email');
      if(_data == null){
        setState((){
          data = _data;
        });
      }else{
        setState((){
          data = _data;
        });
      }
      } catch (e) {
       return false;
    }
  }
}