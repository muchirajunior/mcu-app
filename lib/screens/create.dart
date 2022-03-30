import 'package:flutter/material.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/services/services.dart';
import 'package:mcuapp/utils/utils.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({ Key? key }) : super(key: key);

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {


  var name=TextEditingController();
  var pin0=TextEditingController(text: "Pin 0");
  var pin1=TextEditingController(text: "Pin 1");
  var pin2=TextEditingController(text: "Pin 2");
  var pin3=TextEditingController(text: "Pin 3");
  var pin4=TextEditingController(text: "Pin 4");
  var pin5=TextEditingController(text: "Pin 5");
  var pin6=TextEditingController(text: "Pin 6");
  var pin7=TextEditingController(text: "Pin 7");
  var pin8=TextEditingController(text: "Pin 8");

  var _type;
  bool loading=false;

  changeType(type)=>setState((){_type=type;});

  submit() async{
    setState(() { loading=true; });
    var names=[];
    if(_type=="custom"){
      names=[ pin0.text, pin1.text, pin2.text, pin3.text, pin4.text, pin5.text,pin6.text,pin7.text,pin8.text ];
    }
    var data=generateData(names);

    var result = await createUserProject({"name":name.text,"pins":data}, context);
    if (result=="success"){  snackbar("created project successfully", context);  Navigator.pop(context); }
    else{ snackbar(result, context); }
    setState(() { loading=false; });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("create project"),
      ),

      body: ListView(
    
        children: <Widget>[
          textInput(name, "project name", false),
         
          RadioInputs(_type,changeType),

          _type=="custom" ? Column(
            children: [
               const Padding(
                 padding:  EdgeInsets.all(10.0),
                 child: Text("Write Pins"),
               ),
              textInput(pin0, "pin", false),
              textInput(pin1, "pin", false),
              textInput(pin2, "pin", false),
              textInput(pin3, "pin", false),
              textInput(pin4, "pin", false),
              const Padding(
                 padding:  EdgeInsets.all(10.0),
                 child: Text("Read Pins"),
               ),
              textInput(pin5, "pin", false),
              textInput(pin6, "pin", false),
              textInput(pin7, "pin", false),
              textInput(pin8, "pin", false),
            ],
          ) : const Text(""),
           
          
          loading ? const Center(child: CircularProgressIndicator(),) :
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SubmitButton(method:submit,text: "submit", ),
          )
        ],
      ),
      
    );
  }

 
}