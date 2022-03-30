import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mcuapp/blocs/projects.dart';
import 'package:mcuapp/blocs/user.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future loginUser(BuildContext context, var username,var password) async{
  try {
    var body=jsonEncode({"username":username,"password":password});
    var response= await post(
      Uri.parse( url+"/users/login"),
      body: body,
      headers: {"Content-Type":"application/json"} );
    
    var data=jsonDecode(response.body) as Map<String,dynamic>;
    if (response.statusCode==200){
      data['user']['token']=data['token'];
      userToken=data['token'];
      
      if (kIsWeb){
       print("login via web initialized ...................");
      }
      else{
          var prefs= await SharedPreferences.getInstance();
          prefs.clear();
          var usr=data['user'];
          prefs.setString("name", usr['name']);
          prefs.setString("username", usr['username']);
          prefs.setString("token", usr['token']);
          prefs.setString("id", usr['_id']);

      }

        var usr=User.fromJson(data['user']);
        context.read<UserState>().addUser(usr);
        await context.read<ProjectState>().loadProjects(context);
   
      
      return "success";
    }

    else { return data['msg']; }
    
  } catch (e) {
    print(e);
    return e.toString();

  }

}


getUserProjects(BuildContext context) async{
  var user=context.read<UserState>().state;
  
  try{
    var res= await get(Uri.parse("$url/users/${user.id}/projects"), headers: headers);
    var response=jsonDecode(res.body);
    var data=response.map((json)=>Project.fromJson(json)).toList() as List;
    
    return data;
  }catch(e){
    print(e);
    return "error";
  }
}

logOut(BuildContext context) async{
  if (kIsWeb){Navigator.pushReplacementNamed(context, '/signup');}
  else{
  loadingDialog(context);
  SharedPreferences preferences=await SharedPreferences.getInstance();
  preferences.clear();
  await Future.delayed(const Duration(seconds:3));
  Navigator.pop(context);
  Navigator.pop(context);
  Navigator.pushReplacementNamed(context, '/signup');
  }
}

createUserProject(var data,BuildContext context) async{
  try {
    var usr=context.read<UserState>().state;
    var res = await post(
      Uri.parse("$url/users/${usr.id}/projects"),
      headers: headers,
      body: jsonEncode(data) );
    if(res.statusCode==200){
      await context.read<ProjectState>().loadProjects(context);
      return "success";
    }else{ 
      return jsonDecode(res.body)['msg'];
     }
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}

getProjectPins(String uid,String pid)async{
  try {
    var res=await get(Uri.parse("$url/users/$uid/projects/$pid"), headers: headers);
    var response=jsonDecode(res.body);
    return response.map((json)=>Pin.fromJson(json)).toList();
  } catch (e) {
    print(e.toString());
    return [];
  }
}



deleteProject(String uid, String pid)async{
  try {
    var res = await delete(Uri.parse("$url/users/$uid/projects/$pid"), headers: headers);
    if (res.statusCode==200){return "deleted project successfully";}
    else {return "failed to delete project";}
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}