import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking
{
  Networking(this.url);

  final String url;
  int statusCode;

  Future getData() async
  {
    http.Response response = await http.get(url);
    String data = response.body;
    if(response.statusCode==200) {
      //for retrieving individual data from entire json body we need to go within
      //json which is in a key value format.
      var decodedata = jsonDecode(data);
      return decodedata;
    }
    else
    {
      print(response.statusCode);
    }

  }
}
