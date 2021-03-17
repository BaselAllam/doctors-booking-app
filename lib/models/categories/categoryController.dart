import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/models/categories/categoryModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin CategoryController on Model{


  bool _isAddCategoryLoading = false;
  bool get isAddCategoryLoading => _isAddCategoryLoading;


  bool _isCategoryLoading = false;
  bool get isCategoryLoading => _isCategoryLoading;

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;



  getCategories() async {

    _isCategoryLoading = true;
    notifyListeners();

    // http.Response _response = await http.get('https://doctor-f9742-default-rtdb.firebaseio.com/cateogries.json');

    // var _data = json.decode(_response.body);

    // _data.forEach((x, i) {
    //   final CategoryModel _newCategory = CategoryModel.fromJson(i);
    //     _allCategories.add(_newCategory);
    // });


    Firestore.instance.collection('categories').getDocuments().then((QuerySnapshot shot){
      shot.documents.forEach((i){
        final CategoryModel _newCategory = CategoryModel.fromJson(i.data);
        _allCategories.add(_newCategory);
      });
    });


    _isCategoryLoading = false;
    notifyListeners();
  }



  addCategory(String categoryName, String categoryImage) async {

    _isAddCategoryLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'categoryName' : categoryName,
      'categoryImage' : categoryImage
    }; 


    http.Response _response = await http.post('https://doctor-f9742-default-rtdb.firebaseio.com/cateogries.json', body: json.encode(_data));

    //Firestore.instance.collection('categories').add(_data);

    _isAddCategoryLoading = false;
    notifyListeners();

  }


}