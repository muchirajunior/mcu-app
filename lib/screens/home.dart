import 'package:flutter/material.dart';
import 'package:mcuapp/services/services.dart';
import 'package:mcuapp/utils/utils.dart';

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
        title: Text("user.name!"),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.settings) )
        ],
      ),
      
      body: StreamBuilder<List>(
        stream: getProjects(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            if (snapshot.data!.isNotEmpty){
              return ListView();
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
        
          else if (snapshot.hasError){
            return const Center(child: Text("error loading data"));
          }
          else { return const Center(child: CircularProgressIndicator(),); }
          
        }),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),

    );
  }
}