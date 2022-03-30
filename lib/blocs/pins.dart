
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/models/models.dart';
import 'package:mcuapp/services/services.dart';

class PinState extends Cubit<List<Pin>>{
  PinState() :super ([]);

  getPins(var uid, var pid)async*{
    state.clear();
    var data = await getProjectPins(uid, pid);
    data.forEach((pin)=> state.add(pin) );
    emit([...state]);
  }

  updatePins() async{
    state.clear();
  }
  
}