import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../../../services/auth.dart';
import '../../../constants.dart';


class ProfileImage extends StatelessWidget {

  const ProfileImage({this.data, this.scale});
  final AuthService data;
  final ScreenScaler scale;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shape: const CircleBorder(),
      shadowColor: primaryColor.withOpacity(0.15),
      child: CircleAvatar(
        radius: scale.getFullScreen(13),
        backgroundColor: primaryColor,
        backgroundImage: data.userImage != null
            ? NetworkImage('${data.userImage}')
            : AssetImage('assets/images/user.png'),
      ),
    );
  }
}