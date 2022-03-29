import 'package:mcuapp/models/models.dart';

var userToken="";

Map<String,String> headers={
  "Authorization":"Bearer "+userToken,
  "Content-Type":"application/json"
};

const url="https://muchira-mcuapi.herokuapp.com";

var user=User();
