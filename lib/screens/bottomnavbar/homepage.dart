import 'package:doctor/models/mainmodel.dart';
import 'package:doctor/screens/categoriesandoffers.dart';
import 'package:doctor/screens/doctorprofile.dart';
import 'package:doctor/screens/result.dart';
import 'package:doctor/widgets/customappbar.dart';
import 'package:doctor/widgets/homepageitem.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/searchmap.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctor/widgets/loading.dart';



class HomePage extends StatefulWidget {

final MainModel model;

HomePage(this.model);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    widget.model.getCategories();
    widget.model.getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ScopedModelDescendant(
          builder: (context, child, MainModel model) {
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
                  child: model.isCategoryLoading == true ? Center(child: Loading()) : model.allCategories.isEmpty ? Center(child: Text('no data found')) : scrollSection(model),
                ),
                headLine('Suggested Doctors'),
                allDoctors(model)
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
  scrollSection(MainModel model) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: model.allCategories.length,
      itemBuilder: (context, index){
        return HomePageItem(model.allCategories[index].categoryName, model.allCategories[index].categoryImage, index);
      },
    );
  }
  doctorItem(String drName, String drImage, String category, double rate, String id, MainModel model) {
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
          backgroundImage: NetworkImage(drImage),
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
              '$category',
              style: TextStyle(color: Color(0xff03CBC8), fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 15.0),
                Text(
                '  ${rate.toString()}  25 Reviews',
                style: TextStyle(color: Colors.amber, fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              ],
            ),
          ],
        ),
        onTap: () {
          model.getDoctorId(id);
          Navigator.push(context, MaterialPageRoute(builder: (_) {return DoctorProfile();}));
        }
      ),
    );
  }
  allDoctors(MainModel model) {
    if(model.isGetDoctorloading == true){
      return Center(child: Loading());
    }else if(model.allDoctors.isEmpty){
      return Center(child: Text('no doctors'));
    }else{
      return Column(
        children: [
          for(var i in model.allDoctors) doctorItem(
            i.doctorName,
            i.doctorImage,
            i.category,
            i.rate,
            i.id,
            model
          ),
        ],
      );
    }
  }
}