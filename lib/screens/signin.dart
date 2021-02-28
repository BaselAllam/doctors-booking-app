import 'package:doctor/screens/bottomnavbar/bottomnavbar.dart';
import 'package:flutter/material.dart';




class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController resetEmailController = TextEditingController();

bool pressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 150.0,
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://mms.businesswire.com/media/20160202006046/en/507319/5/dod-logo-icon-large_%281%29.jpg'),
                ),
                shape: BoxShape.circle
              ),
            ),
            field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController),
            field('Password', Icons.lock, TextInputType.text, pressed, passwordController),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text(
                  'Forgot Password ?!',
                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.normal, height: 1.5),
                ),
                onTap: () {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        title: Text(
                          'Enter Email Address',
                          style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        content: field('Email Address', Icons.email, TextInputType.emailAddress, false, resetEmailController),
                        actions: [
                          FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Colors.grey, width: 0.5)),
                            color: Colors.transparent,
                            child: Text(
                              'Send Code',
                              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Colors.grey, width: 0.5)),
                            color: Colors.transparent,
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                  );
                }
              ),
            ),
            Builder(
              builder: (BuildContext context){
                return FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: Color(0xff00BBDC),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if(emailController.text.isEmpty){
                      return Scaffold.of(context).showSnackBar(snack('Email Required!'));
                    }else if(passwordController.text.isEmpty){
                      return Scaffold.of(context).showSnackBar(snack('Password Required!'));
                    }else{
                      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
                    }
                  },
                );
              }
            ),
            SizedBox(height: 10.0),
            FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Colors.grey, width: 0.5)),
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 20.0,
                    maxRadius: 20.0,
                    backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/118-1181708_google-icon-google-logo-design-flaws-hd-png.png'),
                  ),
                  Text(
                    '  Continue with Google',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {},
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Text(
                  'Don\'t have an account ?! Sign Up',
                  style: TextStyle(color: Color(0xff00BBDC), fontSize: 20.0, fontWeight: FontWeight.bold, height: 2.5),
                ),
                onTap: () {}
              ),
            ),
          ],
        ),
      ),
    );
  }
  field(String label, IconData icon, TextInputType type, bool obsecure, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon: label == 'Password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
            iconSize: 20.0,
            onPressed: () {
              setState(() {
                pressed = !pressed;
              });
            }
          ) : null,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        obscureText: obsecure,
        controller: controller,
      ),
    );
  }
  snack(String content) {
    return SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Text(content),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0),))
    );
  }
}