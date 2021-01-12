import 'package:flutter/material.dart';

class Country
{
  String code,name,region;
  Country({
    this.code,this.name,this.region});
Country.fromJson(Map<String,dynamic> json){
  name = json['country'];
  region = json['region'];
}

}