import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/blocs/projects.dart';
import 'package:mcuapp/blocs/user.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/services/services.dart';
import 'package:mcuapp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Launcher extends StatefulWidget {
  const Launcher({ Key? key }) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {

  String uname="";
  bool error=false;

   launchApp(BuildContext context)async{
     setState(() {
       error=false;
     });
    SharedPreferences preferences= await SharedPreferences.getInstance();
    if (preferences.containsKey("name")){
      var id=preferences.getString("id");
      var name=preferences.getString("name");
      setState(() { uname=name as String;});
      var username=preferences.getString("username");
      var token=preferences.getString("token");
      userToken=token as String;
      var user=User(id: id, name:name,username: username,token: token);
      context.read<UserState>().addUser(user);
      var r=await context.read<ProjectState>().loadProjects(context);
      if(r=="failed"){ setState((){error=true;}); }
      else{
      Future.delayed( const Duration(seconds: 4));
      Navigator.pushReplacementNamed(context, '/home');
      }

    }else{
      Future.delayed( const Duration(seconds: 4));
      Navigator.pushReplacementNamed(context, '/signup');
    }
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    error ? "": launchApp(context);
    var screen=MediaQuery.of(context).size;
    return Scaffold(
  
      body: Container(
        width: double.infinity,
        height: double.infinity,
       
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              SizedBox(height: screen.height*.15,),
              const Text("MCU APP", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              SizedBox(height: screen.height*.1,),
              kIsWeb ? const Text("") : Image.asset("assets/welcome.png", height: screen.height*.3,),
              const Expanded(child: Text(""),),
              Container(
                height:screen.height*.3,
                width: screen.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),  
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("welcome $uname ",style:const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),),
                    const SizedBox(height: 10,),
                    const Text("please wait as we load data",style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 20,),
                    error ? SubmitButton(method:()=>launchApp(context), text: "Network error, connect and reload", )  : const CircularProgressIndicator( color: Colors.amber,)
                  ],),
                ),
              ),

            ]
          ),
        ),
      ),
    );
  }
}