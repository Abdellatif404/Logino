import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import '../constants.dart';
import '../my_data.dart';
import '../screens/sign_screen.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    Data data = Provider.of<Data>(context);
    ScreenScaler scale = ScreenScaler();
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserImage(data: data, scale: scale),
            const SizedBox(height: 25),
            Text(
              data.userName ?? 'Anonymous',
              style: TextStyle(fontSize: scale.getFullScreen(9)),
            ),
            const SizedBox(height: 25),
            Text(
              data.userEmail ?? 'newUser@example.com',
              style: TextStyle(fontSize: scale.getFullScreen(7)),
            ),
            const SizedBox(height: 50),
            LogoutButton(data: data, scale: scale),
          ],
        ),
      ),
    );
  }
}



class UserImage extends StatelessWidget {

  const UserImage({this.data, this.scale});
  final Data data;
  final ScreenScaler scale;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shape: const CircleBorder(),
      shadowColor: primaryColor.withOpacity(0.15),
      child: CircleAvatar(
        radius: scale.getFullScreen(16),
        backgroundColor: primaryColor,
        backgroundImage: data.userImage != null
            ? NetworkImage('${data.userImage}')
            : AssetImage('assets/images/user.png'),
      ),
    );
  }
}



class LogoutButton extends StatelessWidget {

  const LogoutButton({this.data, this.scale});
  final Data data;
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
        splashColor: primaryHighLightColor,
        shape: const StadiumBorder(),

        onPressed: () {
          data.signOut().whenComplete(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => SignScreen()));
          });
        },
      ),
    );
  }
}
