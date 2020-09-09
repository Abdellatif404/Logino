import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../../../screens/welcome/welcome.dart';
import '../../../services/auth.dart';
import '../../../constants.dart';


class LogoutButton extends StatelessWidget {

  const LogoutButton({this.data, this.scale});
  final AuthService data;
  final ScreenScaler scale;

  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 12,
      shape: const StadiumBorder(),
      shadowColor: primaryColor.withOpacity(0.2),
      child: FlatButton(
        child: Text('Logout', style: TextStyle(fontSize: scale.getTextSize(7))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: primaryColor,
        highlightColor: primaryHighLightColor,

        onPressed: () {
          data.signOut().whenComplete(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
          });
        },
      ),
    );
  }
}