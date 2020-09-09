import 'package:flutter/material.dart';
import 'package:logino/services/auth.dart';
import 'package:logino/widgets/social_media_button.dart';
import 'package:provider/provider.dart';
import '../../home/home.dart';



class ConnectWithSocialAccount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AuthService data = Provider.of<AuthService>(context);
    void _socialMediaSignIn(Future signInMethod) {
      signInMethod.whenComplete(() {
        if(data.userLoggedIn) {
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
