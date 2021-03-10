import 'package:doctor/widgets/appointmentitem.dart';
import 'package:doctor/widgets/customappbar.dart';
import 'package:flutter/material.dart';



class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> with TickerProviderStateMixin {

TabController tabController;

@override
void initState() {
  tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xff00BBDC),
        leading:  Icon(Icons.sort, color: Colors.white, size: 25.0),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size(0.0, 100.0),
          child: CustomAppBar(
            100.0,
            'Manage Your Appointment',
            TabBar(
              tabs: [
                Text('History'), Text('Upcoming')
              ],
              controller: tabController,
              labelColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.white30,
              unselectedLabelStyle: TextStyle(color: Colors.white30, fontSize: 17.0, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.white, width: 1.0)
              ),
            ),
            'Appointment'
          ),
        ),
      ),
      body: TabBarView(
        children: [
          Pervious(),
          Upcoming(),
        ],
        controller: tabController
      ),
    );
  }
}





class Pervious extends StatefulWidget {
  @override
  _PerviousState createState() => _PerviousState();
}

class _PerviousState extends State<Pervious> {

Map<int, List> data = {
    0: [
      "Ahmed Saber",
      "Dental",
      "Date: 20-Nov-2020",
      "Time: 06:30 PM",
      "https://pulse.doctor/media_/images/photos/doctor4.jpg"
    ],
    1: [
      "Dr. Ahmed Ali",
      "Cardio",
      "Date: 25-Nov-2020",
      "Time: 08:30 PM",
      "https://www.pinnaclecare.com/wp-content/uploads/2017/12/bigstock-African-young-doctor-portrait-28825394-300x425.jpg"
    ],
    2: [
      "Dr. Adel Hamed",
      "General",
      "Date: 10-Dec-2020",
      "Time: 03:30 PM",
      "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"
    ],
    3: [
      "Dr. Samia Omar",
      "Therapy",
      "Date: 10-Dec-2020",
      "Time: 10:00 PM",
      "https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index){
          return AppointmentItem(
            drName : data[index][0],
            type : data[index][1],
            date : data[index][2],
            time : data[index][3],
            image : data[index][4],
            className : 'Pervious'
          );
        }
      ),
    );
  }
}




class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

Map<int, List> data = {
    0: [
      "Ahmed Saber",
      "Dental",
      "Date: 20-Nov-2020",
      "Time: 06:30 PM",
      "https://pulse.doctor/media_/images/photos/doctor4.jpg"
    ],
    1: [
      "Dr. Ahmed Ali",
      "Cardio",
      "Date: 25-Nov-2020",
      "Time: 08:30 PM",
      "https://www.pinnaclecare.com/wp-content/uploads/2017/12/bigstock-African-young-doctor-portrait-28825394-300x425.jpg"
    ],
    2: [
      "Dr. Adel Hamed",
      "General",
      "Date: 10-Dec-2020",
      "Time: 03:30 PM",
      "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"
    ],
    3: [
      "Dr. Samia Omar",
      "Therapy",
      "Date: 10-Dec-2020",
      "Time: 10:00 PM",
      "https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index){
          return AppointmentItem(
            drName : data[index][0],
            type : data[index][1],
            date : data[index][2],
            time : data[index][3],
            image : data[index][4],
            className : 'Upcoming'
          );
        }
      ),
    );
  }
}