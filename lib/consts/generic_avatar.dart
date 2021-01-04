import 'package:flutter/material.dart';

class GenericAvatar{
  
  Widget circleProfile(String url){
    return CircleAvatar(
      maxRadius: 30,
      backgroundColor: Colors.grey,
      backgroundImage: NetworkImage(url));
  }

}