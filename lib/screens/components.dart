import 'package:flutter/material.dart';
import 'package:mcuapp/models/models.dart';

textInput(TextEditingController controller, var hint, bool pass, {int maxlines=1,String label=""}){
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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

class PinInput extends StatelessWidget {
  late NewPin pin;
  PinInput({ Key? key, required this.pin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
     children: <Widget>[
        Text(pin.pin),
        textInput(pin.controller, pin.value, false),
        
     ],
    );
  }
}