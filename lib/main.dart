import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_data.dart';
import 'theme.dart';
import 'screens/sign_screen.dart';



void main() async {
  // After the last update of firebase, you should to initialize your app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (_) => Data(),
      child: MaterialApp(
        title: 'Logino',
        home: SignScreen(),
        theme: buildThemeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
