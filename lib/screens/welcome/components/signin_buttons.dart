import 'package:flutter/material.dart';
import '../../signup/signup.dart';
import '../../login/login.dart';
import 'package:logino/widgets/sign_button.dart';



class SignButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future navigate(widget) => Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SignButton(
          text: 'New account',
          onPressed: () => navigate(SignUp()),
        ),
        const SizedBox(height: 15),
        SignButton(
            text: 'Login',
            isThemePrimary: false,
            onPressed: () => navigate(Login())),
      ],
    );
  }
}