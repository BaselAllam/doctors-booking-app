import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/models/categories/categoryModel.dart';


class CategoryController extends Model{


  bool _isCategoryLoading = true;
  bool get isCategoryLoading => _isCategoryLoading;

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;



  getCategories() async {

    _isCategoryLoading = true;
    notifyListeners();


    Firestore.instance.collection('categories').getDocuments().then((QuerySnapshot shot){
      shot.documents.forEach((i){
        final CategoryModel _newCategory = CategoryModel(
          id: i.documentID,
          categoryName: i['categoryName'],
          categoryImage: i['categoryImage']
        );
        _allCategories.add(_newCategory);
      });
    });


    _isCategoryLoading = false;
    notifyListeners();
  }


}