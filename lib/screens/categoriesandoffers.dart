import 'package:doctor/models/mainmodel.dart';
import 'package:doctor/widgets/homepageitem.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



class CategoriesAndOffers extends StatefulWidget {

final String className;

CategoriesAndOffers(this.className);

  @override
  _CategoriesAndOffersState createState() => _CategoriesAndOffersState();
}

class _CategoriesAndOffersState extends State<CategoriesAndOffers> {
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
          'Categories',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ScopedModelDescendant(
          builder: (context, child, MainModel category) {
            if(category.allCategories.isEmpty){
              return Center(child: Text('No Categories Found'));
            }else{
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8
                ),
                scrollDirection: Axis.vertical,
                itemCount: category.allCategories.length,
                itemBuilder: (context, index){
                  return HomePageItem(category.allCategories[index].categoryName, category.allCategories[index].categoryImage, index);
                }
              );
            }
          }
        ),
      )
    );
  }
}