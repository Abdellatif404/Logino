import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/welcome/welcome.dart';
import 'services/auth.dart';
import 'theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Logino',
        home: WelcomeScreen(),
        theme: buildThemeData(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
