import 'package:flutter/material.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/services/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
 
  themeDialog(){
    return showDialog(context: context, barrierDismissible: true, builder: (context){
      return SetTheme();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Page"),
      ),

      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person_remove),
            title: const Text("LogOut"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: ()=>logOut(context),
          ),

          const Divider(height: 2,),

          ListTile(
            leading:const Icon(Icons.brightness_auto),
            title: const Text("Color Theme"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: ()=>themeDialog(),
          )
        ],
      ),
      
    );
  }
}