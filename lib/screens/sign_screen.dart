import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../widgets/sign_button.dart';
import '../widgets/social_media_button.dart';
import '../my_data.dart';


class SignScreen extends StatelessWidget {
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



class SignButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future navigation(widget) => Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SignButton(
            text: 'New account',
            onPressed: () => navigation(SignUp()),
        ),
        const SizedBox(height: 15),
        SignButton(
            text: 'Login',
            isThemePrimary: false,
            onPressed: () => navigation(Login())),
      ],
    );
  }
}





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





class ConnectWithSocialAccount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Data data = Provider.of<Data>(context);
    void _socialMediaSignIn(Future signInMethod) {
      signInMethod.whenComplete(() {
          if(data.userName != null) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
          }
      });
    }


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialMediaButton(
          image: 'google',
          size: 5.5,
          onPressed: () => _socialMediaSignIn(data.signInWithGoogle()),
        ),
        SocialMediaButton(
          image: 'twitter',
          size: 7,
          onPressed: () => _socialMediaSignIn(data.signInWithTwitter()),
        ),
        SocialMediaButton(
          image: 'facebook',
          size: 6,
          onPressed: () => _socialMediaSignIn(data.signInWithFacebook()),
        ),
      ],
    );
  }
}
