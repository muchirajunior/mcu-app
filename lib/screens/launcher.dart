
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/blocs/theme.dart';
import 'package:mcuapp/blocs/user.dart';
import 'package:mcuapp/models/models.dart';
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

   Future<String> launchApp()async{
    
    SharedPreferences preferences= await SharedPreferences.getInstance();
    if ( !kIsWeb && preferences.containsKey("name")){
      var theme=preferences.getString("theme").toString();
      context.read<ThemeState>().setTheme( theme=="light" ? ThemeMode.light : theme=="dark" ? ThemeMode.dark : ThemeMode.system);
      var id=preferences.getString("id");
      var name=preferences.getString("name");
      setState(() { uname=name.toString();});
      var username=preferences.getString("username");
      var token=preferences.getString("token");
      userToken=token as String;
      var user=User(id: id, name:name,username: username,token: token);
      context.read<UserState>().addUser(user);

      var res= await getUserProjects(context);
      if (res=="error"){ }else{
      
        Future.delayed( const Duration(seconds: 4));
        Navigator.popAndPushNamed(context, '/home');
      }

    }else{
      Future.delayed(const Duration(seconds: 4));
      Navigator.pushReplacementNamed(context, '/signup');
    }

    return "done";
  }


  @override
  void initState() {
    super.initState();
    
  }
//
  @override
  Widget build(BuildContext context) {

    var screen=MediaQuery.of(context).size;
    return Scaffold(
  
      body: FutureBuilder<Object>(
        future: launchApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Network Error", style: Theme.of(context).textTheme.bodyText1 ,),
                  const SizedBox(height: 30,),
                  Text("Please check your internet connection", style: Theme.of(context).textTheme.bodyText1 ,),
                  const SizedBox(height:50),
                  const Padding(
                     padding:  EdgeInsets.all(10.0),
                     child: LinearProgressIndicator(),
                   )
                ],
              )
            );
          }
          else{
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
           
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  SizedBox(height: screen.height*.15,),
                  Text("MCU APP", style: TextStyle(fontSize: 25, color: context.read<ThemeState>().state == ThemeMode.dark ? Colors.white : Colors.grey, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                  SizedBox(height: screen.height*.1,),
                  Image.asset("assets/welcome.png", height: screen.height*.3,),
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
                        const CircularProgressIndicator( color: Colors.amber,)
                      ],),
                    ),
                  ),
      
                ]
              ),
            ),
          );
        }
      }
      ),
    );
  }
}