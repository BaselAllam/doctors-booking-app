import 'package:doctor/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctor/screens/add.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

PickedFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            CustomAppBar(
              170.0,
              '',
              Container(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: image == null ? CircleAvatar(
                    minRadius: 40.0,
                    maxRadius: 40.0,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/44323531?s=460&u=4a0966bc4213dfd7da98c0ca07273948bc32bfad&v=4'),
                  ) : 
                  CircleAvatar(
                    minRadius: 40.0,
                    maxRadius: 40.0,
                    backgroundImage: AssetImage(image.path)
                  ),
                  title: Text(
                    'Bassel Allam',
                    style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'View Profile',
                    style: TextStyle(color: Colors.white54, fontSize: 20.0, fontWeight: FontWeight.normal),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          title: Text(
                            'Choose Camera Or Gallery',
                            style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            FlatButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Colors.grey, width: 0.5)),
                              color: Colors.transparent,
                              child: Text(
                                'Camera',
                                style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                getImage(ImageSource.camera);
                              },
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: Colors.grey, width: 0.5)),
                              color: Colors.transparent,
                              child: Text(
                                'Gallery',
                                style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                getImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        );
                      }
                    );
                  }
                ),
              ),
              'Profile'
            ),
            profileItem(Icons.add, 'Add', () {Navigator.push(context, MaterialPageRoute(builder: (_) {return Add();}));}),
            profileItem(Icons.favorite, 'Favourite', () {}),
            profileItem(Icons.settings, 'Settings', () {}),
            profileItem(Icons.exit_to_app, 'Logout', () {}),
          ],
        ),
      ),
    );
  }
  profileItem(IconData icon, String title, Function onTap) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black, size: 25.0),
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 20.0),
        onTap: onTap
      ),
    );
  }
  getImage(ImageSource source) async {
    var _pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      image = _pickedFile;
    });
  }
}