import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import '../../services/auth.dart';
import '../../widgets/question_row.dart';
import '../home/home.dart';
import '../signup/signup.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/sign_button.dart';



class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ScreenScaler scale = ScreenScaler()..init(context);
    AuthService data = Provider.of<AuthService>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: scale.getHeight(20)),
              SizedBox(height: scale.getHeight(3)),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Your Email',
                onChanged: (value) => data.email = value,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                hintText: 'Password',
                onChanged: (value) => data.password = value,
              ),
              const SizedBox(height: 25),
              SignButton(
                text: 'Log in',
                onPressed: () {
                    data.signInWithEmailAndPassword().whenComplete(() {
                      if (data.userLoggedIn) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
                      }
                    });
                },
              ),
              const SizedBox(height: 35),
              QuestionRow(
                question: "Don't have an account?",
                functionText: 'Create now',
                widget: SignUp(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

