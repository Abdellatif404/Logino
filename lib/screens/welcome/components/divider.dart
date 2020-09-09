import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';



class MyDivider extends StatelessWidget {

  const MyDivider(this.scale);
  final ScreenScaler scale;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        const Expanded(
          child: const Divider(indent: 15, endIndent: 10,),
        ),
        Text(
          'or connect with',
          style: TextStyle(fontSize: scale.getTextSize(6),color: Colors.black26),
        ),
        const Expanded(
          child: const Divider(indent: 10, endIndent: 15,),
        ),
      ],
    );
  }
}