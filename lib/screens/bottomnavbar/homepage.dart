import 'package:doctor/screens/categoriesandoffers.dart';
import 'package:doctor/screens/doctorprofile.dart';
import 'package:doctor/screens/result.dart';
import 'package:doctor/widgets/customappbar.dart';
import 'package:doctor/widgets/homepageitem.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/searchmap.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctor/models/categories/categoryController.dart';
import 'package:doctor/widgets/loading.dart';



class HomePage extends StatefulWidget {

final CategoryController category;

HomePage(this.category);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    widget.category.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ScopedModelDescendant(
          builder: (context, child, CategoryController category) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                CustomAppBar(
                  200.0,
                  'Cairo, Egypt\n Search for Doctors near to you',
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: Colors.white, size: 25.0),
                      title: Text(
                        'Search By Location',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return SearchMap();}));
                      }
                    ),
                  ),
                  'Home'
                ),
                Container(
                  height: 150.0,
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Color(0xffedf7f8),
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/doctorhome.jpg'),
                      alignment: Alignment.centerRight
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  Scheduale your Next\n  Doctor Appointments\n  Today!',
                    style: TextStyle(color: Color(0xff03CBC8), fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
                headLine('Categories'),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  child: category.isCategoryLoading == true ? Center(child: Loading()) : scrollSection(category),
                ),
                headLine('Suggested Doctors'),
                doctorItem('Bassel Allam', 'assets/doctor1.jpg'),
                doctorItem('Shehab Ahmed', 'assets/doctor2.jpg'),
                doctorItem('Mohamed Ahmed', 'assets/doctor3.jpg'),
                doctorItem('Bassel Allam', 'assets/doctor1.jpg'),
                doctorItem('Shehab Ahmed', 'assets/doctor2.jpg'),
                doctorItem('Mohamed Ahmed', 'assets/doctor3.jpg'),
              ],
            );
          }
        ),
      ),
    );
  }
  headLine(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 25.0),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          if(title == 'Suggested Doctors'){
            return Result();
          }else{
            return CategoriesAndOffers(title);
          }
        }));
      }
    );
  }
  scrollSection(CategoryController category) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: category.allCategories.length,
      itemBuilder: (context, index){
        return HomePageItem(category.allCategories[index].categoryName, category.allCategories[index].categoryImage, index);
      },
    );
  }
  doctorItem(String drName, String drImage) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          minRadius: 35.0,
          maxRadius: 35.0,
          backgroundImage: AssetImage(drImage),
        ),
        title: Text(
          'Dr: $drName',
          style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dentists',
              style: TextStyle(color: Color(0xff03CBC8), fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 15.0),
                Text(
                '  4.9  25 Reviews',
                style: TextStyle(color: Colors.amber, fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {return DoctorProfile();}));
        }
      ),
    );
  }
}