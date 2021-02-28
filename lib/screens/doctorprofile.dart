import 'package:doctor/widgets/favicon.dart';
import 'package:doctor/widgets/rating.dart';
import 'package:doctor/widgets/reviewitem.dart';
import 'package:flutter/material.dart';




class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            barItem(),
            Text(
              '  Biography',
              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.0),
            ),
            biographyItem(),
            Text(
              '  Reviews',
              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.0),
            ),
            reviewItems()
          ],
        ),
      ),
    );
  }
  barItem() {
    return Container(
      height: 450,
      margin: EdgeInsets.only(bottom: 15.0),
      child: Stack(
        children: [
          Container(
            height: 250.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg'),
                fit: BoxFit.fill
              ),
            ),
            alignment: Alignment.topCenter,
            child: ListTile(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
              title: Text(
                'Doctor Profile',
                style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 10.0,
            right: 10.0,
            top: 150.0,
            child: Container(
              height: 200.0,
              margin: EdgeInsets.all(20.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dr: Ahmed',
                            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          FavIcon()
                        ],
                      ),
                      Text(
                        'Dentists',
                        style: TextStyle(color: Color(0xff00BBDC), fontSize: 18.0, fontWeight: FontWeight.bold, height: 1.5),
                      ),
                      ReviewItem(4.5, 20),
                      Text(
                        'Location: Helipolis, Cairo, Egypt',
                        style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Fee: 200 \$',
                        style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.calendar_today),
                            color: Color(0xff00BBDC),
                            iconSize: 25.0,
                            onPressed: () {}
                          ),
                          Text(
                            'Book Appointment',
                            style: TextStyle(color: Color(0xff00BBDC), fontSize: 18.0, fontWeight: FontWeight.normal, height: 1.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  biographyItem() {
    return Container(
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: ListTile(
          leading: Container(width: 100.0, child: Image.network('https://identityguide.hms.harvard.edu/files/hmsidentityguide/files/hms_logo_final_rgb.png?m=1580238232')),
          title: Text(
            'Harvard Medical School\nDepartment: Detnists',
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.5),
          ),
          subtitle: Text(
            'Graduation\n2010 : 2015',
            style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold, height: 1.5),
          ),
        ),
      ),
    );
  }
  reviewItems() {
    return Container(
      height: 450.0,
      margin: EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  '4.5   ',
                  style: TextStyle(color: Colors.black, fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  'Overall Rating',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.5),
                ),
                subtitle: RatingBar(
                  onRatingUpdate: null,
                  direction: Axis.horizontal,
                  initialRating: 4.5,
                  itemCount: 5,
                  itemSize: 15,
                  minRating: 1.0,
                  maxRating: 5.0,
                  ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      half: Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                      ),
                      empty: Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      )),
                  glowColor: Colors.yellow,
                  unratedColor: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        leftSideReviewItem(1, 5.0),
                        leftSideReviewItem(2, 4.0),
                        leftSideReviewItem(3, 3.0),
                        leftSideReviewItem(4, 5.0),
                        leftSideReviewItem(5, 1.0),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        rightSideTextItem('Atitude', 'very popular'),
                        rightSideTextItem('Cleannes', 'very clean'),
                        rightSideTextItem('Nurse', 'very helpful'),
                        rightSideTextItem('Punctionality', 'attend at time'),
                        rightSideTextItem('Professionalism', 'very proffisional'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  leftSideReviewItem(int number, double width) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${number.toString()}  ',
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0,),
            height: 8.0,
            color: Colors.amber,
            width: width * 15,
          ),
        ],
      ),
    );
  }
  rightSideTextItem(String title, String subtitle) {
    return Text(
      '$title \n$subtitle\n----',
      style: TextStyle(color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.5),
    );
  }
}