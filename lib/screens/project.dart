import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/blocs/pins.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/services/services.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({ Key? key }) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {

  update(pin, value, owner, pid, context)async{
    loadingDialog(context);
    var result= await updatePin(pin, value, owner, pid, context);
    setState(() {});
    snackbar(result, context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectPinState, Project>(
      builder: (context,project) {
        return Scaffold(
          appBar: AppBar(
            title: Text(project.name.toString()),
            toolbarHeight: 130,
            bottom: PreferredSize(
              child: ListTile(
              title: const Text("project Id"),
              subtitle: Text(project.id.toString()),
              trailing: ElevatedButton(
                onPressed: (){
                  Clipboard.setData(ClipboardData(text: project.id.toString()));
                  snackbar("copied id to clipboard", context);
                },
                child: const Text("copy id"),
              ),
            ),
            preferredSize: const Size.fromHeight(4.0),
            )
          ),

          body: ListView(
            children: project.pins!.map((pin) =>Card(
              child: pin.type.toString() == "write" ? ListTile(
                title: Text(pin.name.toString()),
                leading: CircleAvatar(child: Text(pin.value.toString()),),
                trailing: ElevatedButton(
                  onPressed: ()=>update(pin.pin, pin.value.toString() == "on" ? "off" : "on"  , project.owner, project.id, context),
                  child: const Text("Switch"),),
              ) :
              ListTile(
                title: Text(pin.name.toString()),
                trailing: CircleAvatar(radius: 30, child: Text(pin.value.toString()),),
              )
            ) ).toList(),
          ),
          
        );
      }
    );
  }
}