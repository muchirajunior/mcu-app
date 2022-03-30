import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/blocs/pins.dart';
import 'package:mcuapp/blocs/projects.dart';
import 'package:mcuapp/blocs/user.dart';
import 'package:mcuapp/screens/create.dart';
import 'package:mcuapp/screens/home.dart';  
import 'package:mcuapp/screens/launcher.dart';
import 'package:mcuapp/screens/project.dart';
import 'package:mcuapp/screens/settings.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserState>(create: (_)=>UserState()),
        BlocProvider<ProjectState>(create:(_)=>ProjectState()),
        BlocProvider<ProjectPinState>(create: (_)=>ProjectPinState()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: ThemeMode.light,
    
        initialRoute: kIsWeb ? "/signup" :"/",
        routes: {
          '/':(context)=>const Launcher(),
          '/home':(context)=> const Home(),
          '/signup':(context) => const SignUp(),
          '/create':(context) => const CreateProject(),
          '/project':(context) => const ProjectPage(),
          '/settings':(context) => const SettingsPage()
        },
      ),
    );
  }
}
