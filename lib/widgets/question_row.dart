import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../constants.dart';


class QuestionRow extends StatelessWidget {

  QuestionRow({this.question, this.functionText, this.widget});
  final String question, functionText;
  final Widget widget;

  @override
  Widget build(BuildContext context) {

    ScreenScaler scale = ScreenScaler()..init(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          question,
          style: TextStyle(fontSize: scale.getTextSize(10)),),
        const SizedBox(width: 10),
        GestureDetector(
          child: Text(
            functionText,
            style: TextStyle(color: primaryColor, fontSize: scale.getTextSize(10)),),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
          },
        ),
      ],
    );
  }
}