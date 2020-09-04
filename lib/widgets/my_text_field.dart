import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:logino/my_data.dart';
import 'package:provider/provider.dart';



class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  CustomTextField({this.hintText, this.inputType});

  @override
  Widget build(BuildContext context) {

    Data data = Provider.of<Data>(context);
    ScreenScaler scaler = ScreenScaler()..init(context);

    return Material(
      elevation: 8,
      shape: const StadiumBorder(),
      shadowColor: Color(0xFFFB6158).withOpacity(0.2),
      child: TextField(
        controller: TextEditingController(text: hintText == 'Password' ? '':'@gmail.com'),
        onChanged: (value){
          if (hintText == 'Your Email') {
            data.email = value;
          }
          else {
            data.password = value;
          }
          print('Email: ${data.email} \n Password: ${data.password}');
        },
        keyboardType: inputType,
        obscureText: hintText == 'Password' ? true : false,
        style: TextStyle(fontSize: scaler.getTextSize(12)),
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
