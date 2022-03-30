import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/blocs/pins.dart';
import 'package:mcuapp/blocs/projects.dart';
import 'package:mcuapp/blocs/user.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/services/services.dart';
import 'package:mcuapp/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  deleteproject(pid)async{
    loadingDialog(context);
    var usr=context.read<UserState>().state;
    var result= await deleteProject(usr.id as String, pid);
    snackbar(result, context);
    await context.read<ProjectState>().loadProjects(context);
    Navigator.pop(context);
    
  }



  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
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
           
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/project.png"), fit: BoxFit.fitWidth)
                   ),
                child: ListView.builder(
                  itemCount: snapshot.length,
                  itemBuilder: ((context,index){
                    Project project=snapshot[index];
                    return Card(
                      child: ListTile(
                        title: Text(project.name.toString()),
                        leading: const Icon(Icons.task),
                        trailing:  IconButton(
                          onPressed: ()=>deleteDialog(context,()=>deleteproject(project.id)),
                          icon: const Icon(Icons.delete), ),
                          onTap: (){
                            context.read<ProjectPinState>().setProject(project);
                            Navigator.pushNamed(context, "/project");                          
                          },
                      ),
                    );
                  })
                  ),
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
                   kIsWeb ? const Text("") : Image.asset("assets/project.png", height: screen.height*.3, ),
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