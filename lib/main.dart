import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/bot.dart';
import 'package:health/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'models/authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        )
      ],
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          Chatbot.routeName: (ctx) => MyApp(),
          MainScreen.routeName: (ctx) => MainScreen(),
        },
      ),
    );
  }
}
