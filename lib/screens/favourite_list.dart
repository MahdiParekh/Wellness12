import 'package:flutter/material.dart';
class FavouriteList extends StatefulWidget {
  @override
  _FavouriteListState createState() => _FavouriteListState();
  List favCodeList = new List();
  List favNameList = new List();
  List favRegionList = new List();
  FavouriteList({this.favCodeList,this.favNameList,this.favRegionList});
}

class _FavouriteListState extends State<FavouriteList> {
  @override

  List favCodeList1 = new List();
  List favNameList1 = new List();
  List favRegionList1 = new List();

  void initState()
  {
    super.initState();
    favCodeList1 = widget.favCodeList;
    favNameList1 = widget.favNameList;
    favRegionList1 = widget.favRegionList;
    print(favCodeList1);
  }
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Colors.orange, Colors.red]
      ),
    ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 1,
            child: SizedBox(
              child: ListView.builder(itemCount: favCodeList1.length,
    itemBuilder: (BuildContext context, int index){
     return Row(children: [

                Flexible(flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$index)"),
                ),
              ), Flexible(flex: 1,
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(favCodeList1[index]),
              ),
              ),
              Flexible(flex: 1,
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(favNameList1[index]),
              ),
              ),
              Flexible(flex: 1,
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(favRegionList1[index]),
              ),
              )]);
    }),
            ),
          ),
        ],
      ) ,),);
  }
}
