
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/models/models.dart';


class UserState extends Cubit<User>{
  UserState() : super (User());

   void addUser(User user){
    state.id=user.id;
    state.name=user.name;
    state.username=user.username;
    state.token=user.token;

    emit(state);
  }

}