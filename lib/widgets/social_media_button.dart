import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:logino/constants.dart';


class SocialMediaButton extends StatelessWidget {
  final String image;
  final double size;
  final Function onPressed;
  SocialMediaButton({this.image, this.onPressed,this.size});

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);

    return IconButton(
      onPressed: onPressed,
      icon: Image.asset('assets/icons/$image.png',width: scaler.getWidth(size),),
      splashRadius: 30,
      splashColor: iconButtonHighLightColor,
      highlightColor: iconButtonHighLightColor,
    );
  }
}
