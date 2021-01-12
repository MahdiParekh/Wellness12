import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wellness/services/CountryModel.dart';
import 'package:wellness/screens/country_list.dart';
import 'dart:io';
import 'package:rflutter_alert/rflutter_alert.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  
  int chkNet = 1;
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryData();
    checkInternetConnection();
  }
  
  Future<int> checkInternetConnection() async
  {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        chkNet = 1;
      }
    } on SocketException catch (_) {
      print('not connected');
      chkNet = 0;
    }
    return chkNet;
  }

  void getCountryData() async
  {
   
    print("hello");
CountryModel countryModel = CountryModel();
var countryData = await countryModel.getCountryByCode();
    Navigator.push(context, MaterialPageRoute(builder:(context) {
      return CountryList(countryData: countryData,);}));

print(countryData);
  }


  Widget build(BuildContext context) {
    getCountryData();
    return Scaffold(body: SafeArea(
      child: FutureBuilder(
        future: checkInternetConnection(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if(snapshot.connectionState==ConnectionState.done)
            {
              if(snapshot.data==1) {
                return Container(margin: EdgeInsets.all(30),
                  color: Colors.lightGreenAccent,
                  child: Center(child: SpinKitRotatingCircle(
                      color: Colors.red, size: 100.0)
                  ),);
              }
              else if(snapshot.data==0)
              {


                return  Flexible(child: Center(child: Text("Please check your network connectivity",style: TextStyle(color: Colors.red),)));



              }
            }
          return Container();


        }

      ),
    ),);
  }
}
