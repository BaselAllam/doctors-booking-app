import 'package:flutter/material.dart';




double itemHeight(MediaQueryData data){

  double _deviceHeight = data.size.height;


  if(_deviceHeight <= 550){
    return 250.0;
  }
}