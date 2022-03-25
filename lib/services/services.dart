import 'dart:convert';

import 'package:http/http.dart';
import 'package:mcuapp/utils/utils.dart';

Future loginUser(var username,var password) async{
  try {
    var body=jsonEncode({"username":username,"password":password});
    var response= await post(
      Uri.parse( url+"/users/login"),
      body: body,
      headers: headers );
    
    var data=jsonDecode(response.body);
  
    print(data);
    print(response.statusCode);
  } catch (e) {
    print(e.toString());
  }
  
}