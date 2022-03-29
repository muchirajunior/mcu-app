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

   launchApp(BuildContext context)async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    if (preferences.containsKey("name")){
      var id=preferences.getString("id");
      var name=preferences.getString("name");
      var username=preferences.getString("username");
      var token=preferences.getString("token");
      userToken=token as String;
      var user=User(id: id, name:name,username: username,token: token);
      context.read<UserState>().addUser(user);
      await context.read<ProjectState>().loadProjects(context);
      Navigator.pushReplacementNamed(context, '/home');

    }else{
      Future.delayed( const Duration(seconds: 4));
      Navigator.pushNamed(context, '/signup');
    }
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    launchApp(context);
    return Scaffold(
  
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  const BoxDecoration(image: DecorationImage(fit:BoxFit.cover, image: NetworkImage("https://i.pinimg.com/originals/e7/6f/52/e76f527dd0d43e418a4ddcf7778f7f14.png"))
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const SizedBox(height: 100,),
              const Text("MCU APP", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const SizedBox(height: 200,),
              const  CircularProgressIndicator(),
              const Expanded(child: Text(""),),
              SubmitButton(
                method: ()=>Navigator.pushReplacementNamed(context, '/signup'),
                text: "Get Started",),
              const SizedBox(height: 100,),

            ]
          ),
        ),
      ),
    );
  }
}