import 'package:flutter/material.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/screens/components.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({ Key? key }) : super(key: key);

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {


  var name=TextEditingController();
  var pin1=TextEditingController();

  submit()=>print(name.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("create project"),
      ),

      body: ListView(
    
        children: <Widget>[
          textInput(name, "project name", false),
          // PinInput(pin: NewPin(pin: "pin 0", value: "pin 0", controller: pin1, function: submit, read: true)), 
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SubmitButton(method:submit,text: "submit", ),
          )
        ],
      ),
      
    );
  }
}