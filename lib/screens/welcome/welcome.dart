import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

import 'components/divider.dart';
import 'components/signin_buttons.dart';
import 'components/social_media_buttons.dart';



class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ScreenScaler scale = ScreenScaler();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: scale.getFullScreen(25),),
              SizedBox(height: scale.getHeight(1)),
              SignButtons(),
              const SizedBox(height: 25),
              MyDivider(scale),
              ConnectWithSocialAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
