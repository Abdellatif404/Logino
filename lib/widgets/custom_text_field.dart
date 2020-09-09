import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';



class CustomTextField extends StatelessWidget {
  CustomTextField({this.keyboardType,this.hintText,this.onChanged});
  final TextInputType keyboardType;
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {

    ScreenScaler scaler = ScreenScaler()..init(context);

    return Material(
      elevation: 8,
      shape: const StadiumBorder(),
      shadowColor: Color(0xFFFB6158).withOpacity(0.2),
      child: TextFormField(
        keyboardType: keyboardType,
        style: TextStyle(fontSize: scaler.getTextSize(12)),
        decoration: InputDecoration(hintText: hintText),
        onChanged: onChanged,
      ),
    );
  }
}

