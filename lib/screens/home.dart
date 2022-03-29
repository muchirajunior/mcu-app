import 'package:flutter/material.dart';
import 'package:mcuapp/blocs/projects.dart';
import 'package:mcuapp/blocs/user.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/services/services.dart';
import 'package:mcuapp/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserState, User>(
          builder: (context,user) {
            return Text(user.name.toString());
          }
        ),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pushNamed(context, "/settings"), 
            icon: const Icon(Icons.settings) )
        ],
      ),
      
      body: BlocBuilder< ProjectState,List<Project>>(
       
        builder: (context, snapshot){
          if (snapshot.isNotEmpty){
           
              return ListView.builder(
                itemCount: snapshot.length,
                itemBuilder: ((context,index){
                  Project project=snapshot[index];
                  return Card(
                    child: ListTile(
                      title: Text(project.name.toString()),
                      leading: const Icon(Icons.task),
                      trailing: const Icon(Icons.forward),
                    ),
                  );
                })
                );
          }
            
            else{
              return  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  <Widget>[
                   const Text("you have no project so far"),
                   const SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: ()=>Navigator.pushNamed(context, "/create"),
                       child: const Text("create new project")
                       )
                  ],
                ),
              );
            }
          }
        ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, "/create"),
        child: const Icon(Icons.add),
      ),

    );
  }
}