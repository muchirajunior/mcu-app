import 'package:flutter/material.dart';
import 'package:mcuapp/blocs/theme.dart';
import 'package:mcuapp/screens/components.dart';
import 'package:mcuapp/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  var name=TextEditingController();
  var username=TextEditingController();
  var password=TextEditingController();
  var confirmPassword=TextEditingController();

  bool login=true;
  bool loading=false;

  Widget SignUpTab(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabButton("login"),
            tabButton("register")
          ],
        ),
        Container(
          height: 4,
          width: double.infinity,
          color: Colors.grey, 
          child:AnimatedAlign(
            alignment: login ? Alignment.centerLeft : Alignment.centerRight,
            duration: const Duration(seconds: 1),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: MediaQuery.of(context).size.width*0.5,
              height: 4,
              color: Theme.of(context).primaryColor,
            )
            )
        ),
      ],
    );
  }

  TextButton tabButton(var text) {
    return TextButton(onPressed: ()=>switchTab(text), 
          child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold),));
  }

  submit() async{
    setState(() { loading=true; });
    
    var res= login ? await loginUser(context, username.text, password.text) : await registerUser(name.text, username.text, password.text, confirmPassword.text, context) ;
    if (res=="success") {Navigator.pushReplacementNamed(context,"/home");}
    else {snackbar(res, context);}
    setState(() { loading=false; });
  }

  switchTab(var tab){
    login = tab =="login"? true : false;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    var screen =  MediaQuery.of(context).size;
    return Scaffold(
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:screen.height*.1),
              Text("Sign Up", style: TextStyle(fontSize: 20, color: context.read<ThemeState>().state == ThemeMode.dark ? Colors.white : Colors.grey, fontWeight: FontWeight.bold),),
              
              const SizedBox(height: 20,),
             Image.asset("assets/signup.png", height:screen.height*.25,),
              SignUpTab(),
              
              !login ? textInput(name, "name", false): const Text(""),

              textInput(username, "username", false),

              textInput(password, "password", true),

              !login ? textInput(confirmPassword, "confirm passord", true): const Text(""),
        
              const SizedBox(height: 20,),
              loading ? const CircularProgressIndicator() :  SubmitButton(method: submit,text: login ? "Login " :"Register",)
        
            ],
          ),
        ),
      ),

    );
  }
}