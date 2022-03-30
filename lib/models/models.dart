import 'package:flutter/cupertino.dart';

class User{
  String? id;
  String? name;
  String? username;
  String? token;

  User({  this.id, this.name, this.username, this.token});

  User.fromJson(Map json):
      id=json['_id'],
      name=json['name'],
      username=json['username'],
      token=json['token'] ;
}

class Project{
  String? id;
  String? owner;
  String? name;

  Project({this.id,this.name,this.owner});

  Project.fromJson(Map json):
      id=json['_id'],
      owner=json['owner'],
      name=json['name'];
}

class Pin{
  int? pin;
  String? name;
  bool? type;
  var value;

  Pin({this.pin,this.name,this.type,this.value});

  Pin.fromJson(Map json):
    pin=json['pin'],
    name=json['name'],
    type=json['type'],
    value=json['value'];

   toJson(Pin pin)=>{
     "pin":pin,
     "name":name,
     "type":type,
     "value":value
   };

}

class NewPin{
  String pin;
  String value;
  TextEditingController controller;
  Function function;
  bool read;

  NewPin({required this.pin,required this.value,required this.controller,required this.function, required this.read});
}