import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:doctor/models/doctors/doctorModel.dart';


mixin DoctorController on Model{


  bool _isAddDoctorLoading = true;
  bool get isAddDoctorloading => _isAddDoctorLoading;


  bool _isGetDoctorLoading = true;
  bool get isGetDoctorloading => _isGetDoctorLoading;

  List<DoctorModel> _allDoctors = [];
  List<DoctorModel> get allDoctors => _allDoctors;

  String _selectedId;


  getDoctorId(String id){
    return _selectedId = id;
  }


  DoctorModel get selectedDoctor{
    return _allDoctors.firstWhere((DoctorModel doctor){
      return doctor.id == _selectedId;
    });
  }


  final FirebaseStorage _storage = FirebaseStorage(storageBucket: 'gs://doctor-f9742.appspot.com/');


  addDoctor(String doctorName, double fee, String location, double rate, String university, String category, String collegeImage, PickedFile image) async {

    _isAddDoctorLoading = true;
    notifyListeners();

    File _file = File(image.path);

    String _imageName = 'images/${DateTime.now().toString()}';

    StorageTaskSnapshot _uploadTask = await _storage.ref().child(_imageName).putFile(_file).onComplete;
    String _imageUrl = await _uploadTask.ref.getDownloadURL();

    Map<String, dynamic> _data = {
      'doctorName' : doctorName,
      'fee' : fee,
      'location' : location,
      'rate' : rate,
      'university' : university,
      'category' : category,
      'collegeImage' : collegeImage,
      'doctorImage' : _imageUrl
    };


    Firestore.instance.collection('doctors').add(_data);


    _isAddDoctorLoading = false;
    notifyListeners();

  }



  getDoctors() async {


    _isGetDoctorLoading = true;
    notifyListeners();


    Firestore.instance.collection('doctors').getDocuments().then((QuerySnapshot shot){
      shot.documents.forEach((i) {
        final DoctorModel _newDoctor = DoctorModel.fromJson(i.data, i.documentID);
        _allDoctors.add(_newDoctor);
      });
    });

    _isGetDoctorLoading = false;
    notifyListeners();

  }


}