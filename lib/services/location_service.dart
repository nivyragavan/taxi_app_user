import 'dart:convert';

import 'package:http/http.dart' as http;


class LocationService{

   Future getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    print(url);
    print(response.statusCode);
    print(response.body.toString());
      if(response.statusCode == 200){
        print(response.statusCode);
        print(response.body);
        var jsonData = response.body;
        print(jsonData);
        var decodeData = jsonDecode(jsonData);
        return decodeData;
      }else{
        print('=====failed=====');
        return "Failed";
      }
  }
}