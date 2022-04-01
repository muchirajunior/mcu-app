
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/models/models.dart';

class ProjectState extends Cubit<List<Project>>{
  ProjectState () :super ([]);

   loadProjects(var data){    
    state.clear();
    data.forEach((item)=> state.add(item));
    emit([...state]);
  }

}