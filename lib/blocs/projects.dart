
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/services/services.dart';

class ProjectState extends Cubit<List<Project>>{
  ProjectState () :super ([]);

   loadProjects(BuildContext context)async{
    state.clear();
    var data= await getUserProjects(context);
    if (data=="error"){return "failed";}
    state.clear();
    data.forEach((item)=> state.add(item));
    emit([...state]);
  }

}