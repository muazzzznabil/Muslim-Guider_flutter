import 'package:flutter/material.dart';


class Mosquelocator{
  String name;
  //double distance;

  Mosquelocator({
    required this.name,
    //required this.distance,
  });

  factory Mosquelocator.fromJson(Map<String, dynamic> json){
    return Mosquelocator(
        name: json['name']
    );
  }

}