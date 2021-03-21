import 'package:doctor/screens/bottomnavbar/bottomnavbar.dart';
import 'package:flutter/material.dart';




class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController mobileNumberController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
GlobalKey<FormState> nameKey = GlobalKey<FormState>();
GlobalKey<FormState> mobileNumberKey = GlobalKey<FormState>();

final _formKey = GlobalKey<FormState>();

bool pressed = true;

String countryCode = 'Code';

bool checked = false;

DateTime birthDate = DateTime(1960);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
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
              field('Email Address', Icons.email, TextInputType.emailAddress, false, emailController, emailKey),
              field('Full Name', Icons.person, TextInputType.text, false, nameController, nameKey),
              Row(
                children: [
                   PopupMenuButton(
                        child: Text(
                          countryCode,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        itemBuilder: (BuildContext context){
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem(
                              child: Text(
                                'Egypt +20',
                                style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              value: '+20'
                            ),
                            PopupMenuItem(
                              child: Text(
                                'UAE +967',
                                style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              value: '+967'
                            ),
                            PopupMenuItem(
                              child: Text(
                                'Mansoura +050',
                                style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              value: '+050'
                            ),
                            PopupMenuItem(
                              child: Text(
                                'Kuwait +965',
                                style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              value: '+965'
                            ),
                          ];
                        },
                        onSelected: (String value){
                          setState(() {
                            countryCode = value;
                          });
                        },
                      ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.22,
                    child: field('Mobile Number', Icons.phone_android, TextInputType.number, false, mobileNumberController, mobileNumberKey),
                  ),
                ], 
              ),
              field('Password', Icons.lock, TextInputType.text, pressed, passwordController, passwordKey),
              ListTile(
                title: Text(
                    'Date of Birth',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                subtitle: Text(
                  '${birthDate.toString().substring(0, 10)}',
                  style: TextStyle(color: Colors.grey, fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  var _pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1960),
                    lastDate: DateTime(2002),
                    initialDate: DateTime(1960),
                  );
                  setState(() {
                    birthDate = _pickedDate;
                  });
                },
              ),
              ListTile(
                title: Text(
                    'Accept Terms & Conditions',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                trailing: Checkbox(
                  value: checked,
                  onChanged: (value){
                    setState(() {
                      checked = value;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.white,
                ),
              ),
              Builder(
                builder: (BuildContext context){
                  return FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    color: Color(0xff00BBDC),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if(!_formKey.currentState.validate()){
                        Scaffold.of(context).showSnackBar(snack('fields Required!'));
                      }else if(checked == false){
                        Scaffold.of(context).showSnackBar(snack('Accepts Terms & Condtions!'));
                      }else{
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
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
                    'have an account ?! Sign In',
                    style: TextStyle(color: Color(0xff00BBDC), fontSize: 20.0, fontWeight: FontWeight.bold, height: 2.5),
                  ),
                  onTap: () {
                    return Navigator.pop(context);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  field(String label, IconData icon, TextInputType type, bool obsecure, TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value.isEmpty){
            return 'This Field required?';
          }else{
            return null;
          }
        },
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