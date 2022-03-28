import 'package:mcuapp/models/models.dart';


Map<String,String> headers={
  "Authorization":"Bearer "+user.token!,
  "Content-Type":"application/json"
};

const url="https://muchira-mcuapi.herokuapp.com";

var user=User();
