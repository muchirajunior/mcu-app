import 'package:flutter/material.dart';
import 'package:mcuapp/screens/home.dart';
import 'package:mcuapp/screens/launcher.dart';
import 'package:mcuapp/screens/signup.dart';
import 'package:mcuapp/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        '/':(context)=>const Launcher(),
        '/home':(context)=> const Home(),
        '/signup':(context) => const SignUp()
      },
    );
  }
}
