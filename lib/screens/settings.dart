import 'package:flutter/material.dart';
import 'package:mcuapp/services/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            tileColor: Colors.white,
            onTap: ()=>logOut(context),
          ),

          const Divider(height: 2,),

          const ListTile(
          leading: Icon(Icons.brightness_auto),
          title: Text("Color Theme"),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          tileColor: Colors.white,
          )
        ],
      ),
      
    );
  }
}