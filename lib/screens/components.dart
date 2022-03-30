import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/blocs/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

textInput(TextEditingController controller, var hint, bool pass, {int maxlines=1,String label=""}){
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      obscureText: pass,
      controller: controller,
      maxLines: maxlines,
       decoration: InputDecoration(
         contentPadding: const EdgeInsets.all(10),
         border: InputBorder.none,
         hintText: hint,
       ),
    ),
  );
}

class SubmitButton extends StatelessWidget {
  Function method;
   var text;
  SubmitButton({ Key? key, this.text,required this.method }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.95,
      height: 40,
      child: ElevatedButton(
        onPressed: ()=> method(),
        child: Text(text),
      ),
    );
  }
}

snackbar(String text, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text))
  );
}

 Widget RadioInputs(_type,changeType) {
 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            const Padding(
              padding:  EdgeInsets.fromLTRB(20, 5, 0, 5),
              child: Text("Select Pin Naming"),),
            RadioListTile(title: const Text("Default naming"), value: "defalut", groupValue: _type, onChanged: (value)=>changeType(value)),
            RadioListTile(title: const Text("Custom naming"), value: "custom", groupValue: _type, onChanged: (value)=>changeType(value)),
  
          ]
        );
  }

loadingDialog(BuildContext context){
  return showDialog(context: context, barrierDismissible: false, builder: (context){
    return const AlertDialog(
      backgroundColor: Colors.transparent,
      title: Text("please wait...", style: TextStyle(color: Colors.white),),
      content: SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator())),
    );
  });
}

deleteDialog(BuildContext context, Function method){
  return showDialog(context: context, barrierDismissible: true, builder: (context){
    return  AlertDialog(
      title:const Text("Warning"),
      content: const Text("This action is not reversible !!"),
      actions:[
        IconButton(onPressed: (){ 
            Navigator.pop(context);
            method();}, 
            icon: const Icon(Icons.delete), color: Colors.red,),
        IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.cancel), color: Colors.amber,),
      ]
    );
  });
}



class SetTheme extends StatefulWidget {
  const SetTheme({ Key? key }) : super(key: key);

  @override
  _SetThemeState createState() => _SetThemeState();
}

class _SetThemeState extends State<SetTheme> {
  var theme;
  
  setTheme(val) async{
    setState((){theme=val;});
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString("theme", val);
    
    context.read<ThemeState>().setTheme( theme=="light" ? ThemeMode.light : theme=="dark" ? ThemeMode.dark : ThemeMode.system);
    Navigator.pop(context);
    }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:const Text("select Theme"),
      content:  SizedBox(
        height: 200,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              RadioListTile(title: const Text("Light Theme"), value: "light", groupValue: theme, onChanged: (value)=>setTheme(value)),
              RadioListTile(title: const Text("Dark Theme"), value: "dark", groupValue: theme, onChanged: (value)=>setTheme(value)),
              RadioListTile(title: const Text("System Theme"), value: "system", groupValue: theme, onChanged: (value)=>setTheme(value)),
  
            ]
          ),
      )
    );
  }
}
