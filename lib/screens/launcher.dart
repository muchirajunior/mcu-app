import 'package:flutter/material.dart';

class Launcher extends StatefulWidget {
  const Launcher({ Key? key }) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {

   launchApp()async{
    Future.delayed( const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    // launchApp();
    return Scaffold(
  
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  const BoxDecoration(image: DecorationImage(fit:BoxFit.cover, image: NetworkImage("https://i.pinimg.com/originals/e7/6f/52/e76f527dd0d43e418a4ddcf7778f7f14.png"))
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
               Text("MCU APP", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
               SizedBox(height: 200,),
               CircularProgressIndicator(),

            ]
          ),
        ),
      ),
    );
  }
}