import 'dart:convert';

import 'package:http/http.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/utils/utils.dart';

Future loginUser(var username,var password) async{
  try {
    var body=jsonEncode({"username":username,"password":password});
    var response= await post(
      Uri.parse( url+"/users/login"),
      body: body,
      headers: {"Content-Type":"application/json"} );
    
    var data=jsonDecode(response.body) as Map<String,dynamic>;
    if (response.statusCode==200){
      data['user']['token']=data['token'];
      user=User.fromJson(data['user']);
      
      return "success";
    }

    else { return data['msg']; }
    
  } catch (e) {
    print(e);
    return e.toString();

  }

}

Stream<List> getProjects() async*{

  try{
    var res= await get(Uri.parse("$url/users/${user.id}/projects"), headers: headers);
    var response=jsonDecode(res.body);
    var data=response.map((json)=>Project.fromJson(json));
    data.forEach((item){
      print(item.pins);
    });
    yield [];
  }catch(e){
    print(e);
  }
}