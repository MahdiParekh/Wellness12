

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:http/http.dart' as http;
import 'package:wellness/screens/favourite_list.dart';
import 'dart:convert';
import 'package:wellness/services/country.dart';
import 'dart:async';
class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
  final countryData;
  CountryList({this.countryData});
}

class _CountryListState extends State<CountryList> {
  @override
var code,country,region;

  int presentindex;

Map m1 = new Map();

List l1 = new List();
List l2 = new List();
List l3 = new List();

int indicator;

List<Widget> countryTable = new List();

List<IconButton> iconlist = new List();

List favouriteNameList = new List();
  List favouriteCodeList = new List();
  List favouriteRegionList = new List();

  var distinctfavCodelist = new List();
  var distinctfavNamelist = new List();
  var distinctfavReglist = new List();

List<int> checkedList = new List();


  void initState()
  {

    super.initState();
    indicator = 0;
    getJsonData();
    //getJsonData();

  }


  void check( int a)
  {}

  void getJsonData()
  {
    l1.clear();
    l2.clear();
    l3.clear();

    country=widget.countryData['data'];
    m1.addAll(country);
    m1.forEach((key, value) {
      l1.add(key);
      l2.add(value['country']);
      l3.add(value['region']);
    });



  }

  List<Widget> favo()
  {
    for(int i =0;i<l1.length;i++) {
      for (int j = 0; j < checkedList.length; j++) {
        if (checkedList[j] == i) {
          iconlist.add(
              IconButton(icon: Icon(Icons.favorite, color: Colors.red,),));
        }

      }
    }
    return iconlist;
  }

  Widget build(BuildContext context) {



    return Scaffold(body: buildBody(context),);
  }
  Widget buildBody(BuildContext context)
  {
    void checkedForSelectedFavourite()
    {
      Timer(Duration(seconds: 5),(){
        for(int i =0;i<l1.length;i++) {
          for (int i = 0; i < checkedList.length; i++) {
            if (i == checkedList[i]) {

              indicator = 1;
            }
            else {
              indicator = 0;
            }
          }
        }
      });
    }




   return Container(decoration: BoxDecoration(
     gradient: LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.topRight,
         colors: [Colors.orange, Colors.red]
     ),
   ),
     child: Stack(
       children: [
         Expanded(flex: 1,
           child: SizedBox(
             child:Stack(
               children: [
                 ListView.builder(itemCount: l1.length,
                     itemBuilder: (BuildContext context, int index){





                       return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),border: Border.all(color: Colors.yellowAccent)),
                         child: Row(children: [

                           Flexible(flex: 1,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text("$index)"),
                             ),
                           ), Flexible(flex: 1,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(l1[index]),
                             ),
                           ),
                           Flexible(flex: 1,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(l2[index]),
                             ),
                           ),
                           Flexible(flex: 1,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(l3[index]),
                             ),
                           ),



                                 Flexible(flex: 1,
                                     child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: IconButton(icon: Icon(Icons.favorite,semanticLabel: "Favouite",color:(index==presentindex)?Colors.red:Colors.black),onPressed: () {
                                     presentindex = index;
                                     checkedForSelectedFavourite();
                                     //indicator=0;
                                     favouriteCodeList.add(l1[index]);
                                     favouriteNameList.add(l2[index]);
                                     favouriteRegionList.add(l3[index]);
                                     checkedList.add(index);
                                      distinctfavCodelist = favouriteCodeList.toSet().toList();
                                      distinctfavNamelist = favouriteNameList.toSet().toList();
                                      distinctfavReglist = favouriteRegionList.toSet().toList();
                                      print(distinctfavCodelist);
                                      print(distinctfavNamelist);
                                      print(distinctfavReglist);

                                     var distinctchecklist = checkedList.toSet().toList();

                                     print(distinctchecklist);
                                     },tooltip: "Add To Favourites",),  )
                                     ),

                           Flexible(child: IconButton(icon: Icon(Icons.remove,),onPressed: (){
                             distinctfavCodelist.remove(l1[index]);
                             distinctfavNamelist.remove(l2[index]);
                            // favouriteRegionList.remove(l3[index]);
                             print(distinctfavCodelist);
                             print(distinctfavNamelist);
                             print(favouriteRegionList);
                           },))

                         ],),
                       );
                     }),
//
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,

                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(230,40,8,8),
                       child: SafeArea(
                         child: FlatButton(
                             onPressed: (){
                           Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (context) {
                                 return FavouriteList(favCodeList: distinctfavCodelist,favNameList: distinctfavNamelist,favRegionList: favouriteRegionList,);
                               },
                             ),
                           );
                         }, child: Container(decoration:BoxDecoration(gradient:LinearGradient(
                             begin: Alignment.topLeft,
                             end: Alignment.topRight,
                             colors: [Colors.purple, Colors.lightGreenAccent]
                         ),
                             borderRadius: BorderRadius.circular(10.0),border: Border.all(color: Colors.yellowAccent)) ,
                             child: Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Text("Favourites"),
                             ))),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
   );


  }
}
