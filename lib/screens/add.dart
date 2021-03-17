import 'package:doctor/models/mainmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctor/widgets/loading.dart';



class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> with TickerProviderStateMixin {

TextEditingController categoryTitleController = TextEditingController();

GlobalKey<FormState> categoryTitleKey = GlobalKey<FormState>();
final _categoryFormKey = GlobalKey<FormState>();

TextEditingController doctorNameController = TextEditingController();
GlobalKey<FormState> doctorNameKey = GlobalKey<FormState>();
TextEditingController feeController = TextEditingController();
GlobalKey<FormState> feeKey = GlobalKey<FormState>();
TextEditingController locationController = TextEditingController();
GlobalKey<FormState> locationKey = GlobalKey<FormState>();
TextEditingController rateController = TextEditingController();
GlobalKey<FormState> rateKey = GlobalKey<FormState>();
TextEditingController universityController = TextEditingController();
GlobalKey<FormState> universityKey = GlobalKey<FormState>();
TextEditingController categoryController = TextEditingController();
GlobalKey<FormState> categoryKey = GlobalKey<FormState>();


final _doctorFormKey = GlobalKey<FormState>();

TabController tabController;

PickedFile image;

@override
void initState() {
  tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        title: Text(
          'Add',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size(0.0, 50.0),
          child: TabBar(
            tabs: [
              Text('Category'), Text('Doctor')
            ],
            controller: tabController,
            labelColor: Colors.black,
            labelStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black, width: 1.0)
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: [
            category(),
            dr()
          ],
        ),
      ),
    );
  }
  dr() {
    return Form(
      key: _doctorFormKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
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
                style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
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
          field('Doctor Name', TextInputType.text, doctorNameController, doctorNameKey),
          field('fee', TextInputType.text, feeController, feeKey),
          field('Location', TextInputType.text, locationController, locationKey),
          field('Rate', TextInputType.text, rateController, rateKey),
          field('University', TextInputType.text, universityController, universityKey),
          field('Category', TextInputType.text, categoryController, categoryKey),
          ScopedModelDescendant(
            builder: (context, child, MainModel model){
              return Builder(
                builder: (BuildContext context){
                  return FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    color: Color(0xff00BBDC),
                    child: model.isAddDoctorloading == true ? Center(child: Loading()) : Text(
                      'Add Doctor',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if(!_doctorFormKey.currentState.validate()){
                        Scaffold.of(context).showSnackBar(snack('Fields Required!'));
                      }else{
                        model.addDoctor(
                          doctorNameController.text,
                          double.parse(feeController.text),
                          locationController.text,
                          double.parse(rateController.text),
                          universityController.text,
                          categoryController.text,
                          'http://internationalscholarships.ca/wp-content/uploads/MIT-Logo.jpg',
                          image
                        );
                      }
                    }
                  );
                }
              );
            }
          ),
        ],
      ),
    );
  }
  category() {
    return Form(
      key: _categoryFormKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          field('Category Title', TextInputType.text, categoryTitleController, categoryTitleKey),
          ScopedModelDescendant(
            builder: (context, child, MainModel model){
              return Builder(
                builder: (BuildContext context){
                  return FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    color: Color(0xff00BBDC),
                    child: model.isAddCategoryLoading == true ? Center(child: Loading()) : Text(
                      'Add Category',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if(!_categoryFormKey.currentState.validate()){
                        Scaffold.of(context).showSnackBar(snack('Fields Required!'));
                      }else{
                        model.addCategory(categoryTitleController.text, 'https://pulse.doctor/media_/images/photos/doctor4.jpg');
                      }
                    }
                  );
                }
              );
            }
          ),
        ],
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
  field(String label, TextInputType type, TextEditingController controller, Key key) {
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
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        controller: controller,
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