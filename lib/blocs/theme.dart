
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeState extends Cubit<ThemeMode>{
  ThemeState() :super (ThemeMode.light);

  setTheme(ThemeMode mode){
    emit(mode);
  }
}