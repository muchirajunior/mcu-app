
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/models/models.dart';

class ProjectPinState extends Cubit<Project>{
  ProjectPinState() :super (Project());

  void setProject(Project project){
    state.id=project.id;
    state.name=project.name;
    state.owner=project.owner;
    state.pins=project.pins;

    emit(state);
  }
  
}