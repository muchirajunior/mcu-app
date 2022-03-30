import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcuapp/models/models.dart';

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