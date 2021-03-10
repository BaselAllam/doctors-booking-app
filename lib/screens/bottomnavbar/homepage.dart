import 'package:doctor/screens/categoriesandoffers.dart';
import 'package:doctor/screens/doctorprofile.dart';
import 'package:doctor/screens/result.dart';
import 'package:doctor/widgets/customappbar.dart';
import 'package:doctor/widgets/homepageitem.dart';
import 'package:flutter/material.dart';
import 'package:doctor/screens/searchmap.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


Map<int, List> categories = {
  0 : [
    'Dentists',
    'https://image.freepik.com/free-vector/children-s-dentist-patient_42515-334.jpg'
  ],
  1 : [
    'General',
    'https://cdn.pixabay.com/photo/2020/12/09/16/41/stethoscope-5817919_1280.png'
  ],
  2 : [
    'Cardioilogist',
    'https://www.shareicon.net/data/512x512/2017/03/27/881663_medical_512x512.png'
  ],
  3 : [
    'Kids',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJQtnoIW8DcWTBL-C9vMA3CQOMUxQA1GEbtA&usqp=CAU'
  ],
  4 : [
    'Covid19',
    'https://image.freepik.com/free-vector/flat-illustration-vaccines-liquid-medicines-patients-hospitals-public-health-design-healthcare_4968-1231.jpg'
  ],
};


Map<int, List> offers = {
  0 : [
    '25% Off',
    'https://img.freepik.com/free-vector/discount-concept-illustration_114360-1852.jpg?size=626&ext=jpg'
  ],
  1 : [
    '50% Off',
    'https://image.freepik.com/free-vector/discount-loyalty-card-loyalty-program-customer-service-rewards-card-points-concept-isolated-concept-illustration-with-tiny-people-floral-elements-hero-image-website_126608-770.jpg'
  ],
  2 : [
    'up to 75%',
    'https://image.freepik.com/free-vector/people-celebrating-with-gift-card-voucher-isolated-flat-vector-illustration-cartoon-happy-customers-winning-abstract-prize-certificate-discount-coupon-creative-strategy-camp-money_74855-8500.jpg'
  ],
  3 : [
    '10% off',
    'https://image.freepik.com/free-vector/black-friday-shop-people-buying-super-discount-shop-online-service-promo-purchase-marketing-illustration_101179-927.jpg'
  ],
};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
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
              child: scrollSection(categories),
            ),
            headLine('Today Offers'),
            Container(
              height: MediaQuery.of(context).size.height/3,
              child: scrollSection(offers),
            ),
            headLine('Suggested Doctors'),
            doctorItem('Bassel Allam', 'assets/doctor1.jpg'),
            doctorItem('Shehab Ahmed', 'assets/doctor2.jpg'),
            doctorItem('Mohamed Ahmed', 'assets/doctor3.jpg'),
            doctorItem('Bassel Allam', 'assets/doctor1.jpg'),
            doctorItem('Shehab Ahmed', 'assets/doctor2.jpg'),
            doctorItem('Mohamed Ahmed', 'assets/doctor3.jpg'),
          ],
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
  scrollSection(Map<int, List> map) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: map.length,
      itemBuilder: (context, index){
        return HomePageItem(map, index);
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