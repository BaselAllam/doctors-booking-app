import 'package:doctor/widgets/resultitem.dart';
import 'package:flutter/material.dart';



class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

Map<int, List> filters = {
    0: [
      Icons.filter_list_sharp,
      'Filter',
      ['Rating Low to High', 'Rating High to Low', 'Price Low to High', 'Price Hight to Low']
      ],
    1: [
      Icons.keyboard_arrow_down_rounded,
      'Gender',
      ['Male', 'Female']
      ],
    2: [
      Icons.keyboard_arrow_down_rounded,
      'Distance',
      ['5 KM', '10 KM', '15 KM', '20 KM']
      ],
    3: [
      Icons.keyboard_arrow_down_rounded,
      'Payment',
      ['Cache', 'Visa']
    ]
  };

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
          'Browse',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: filter(filters),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index){
                  return ResultItem(
                    drName: 'Ahmed Abd Ala',
                    currency: 'EGP',
                    fee: 200,
                    image: 'https://avatars.githubusercontent.com/u/44323531?s=460&u=4a0966bc4213dfd7da98c0ca07273948bc32bfad&v=4',
                    location: 'Heliopolis, Cairo, Egypt',
                    rating: 4.5,
                    reviews: 20,
                    type: 'Dentists',
                  );
                } 
              ),
            ),
          ],
        )
      ),
    );
  }
  filter(Map map) {
    return Container(
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: map.length,
        itemBuilder: (context, index) {
          return FilterItem(map, index);
        }
      ),
    );
  }
}




class FilterItem extends StatefulWidget {

final Map<int, List> map;
final int index;

FilterItem(this.map, this.index);

  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {

bool check = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20))),
          builder: (BuildContext context){
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SafeArea(
                    top: true,
                    child: Text(
                      '${widget.map[widget.index][1]}',
                      style: TextStyle(
                          color: Color(0xff00BBDC),
                          fontWeight: FontWeight.bold,
                          fontSize: 25, height: 1),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: widget.map[widget.index][2].length,
                      itemBuilder: (context, index){
                        return filterSubItem(widget.map[widget.index][2][index]);
                      }
                    ),
                  ),
                ],
              ),
            );
          }
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xff00BBDC), width: 1),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.map[widget.index][1]}  ',
              style: TextStyle(
                  color: Color(0xff00BBDC),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(width: 5),
            Icon(
              widget.map[widget.index][0],
              color: Color(0xff00BBDC),
              size: 30,
            )
          ],
        ),
      ),
    );
  }
  filterSubItem(String title) {
    return ListTile(
      title : Text(
        '$title',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      trailing: Checkbox(
        activeColor: Color(0xff00BBDC),
        hoverColor: Colors.white,
        checkColor: Colors.white,
        value: check,
        onChanged: (value) {
          setState(() {
            check = value;
          });
        },
      ),
    );
  }
}