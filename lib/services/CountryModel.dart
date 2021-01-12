import 'package:flutter/material.dart';
import 'package:wellness/services/networking.dart';

const ApiKey = '20210111164255';
const countryUrl = 'https://api.first.org/data/v1/countries';

class CountryModel
{
Future<dynamic> getCountryByCode() async
{

//we can only wait on methods that return futures

  Networking networkHelper = Networking(
      '$countryUrl?appid=$ApiKey&units=metric');
  var countryData = await networkHelper.getData();
  return countryData;
}

}