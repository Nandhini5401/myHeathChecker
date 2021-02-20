import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/screens/signup_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/background3.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ])),
          ),
          Builder(builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome!!!',
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Health Tracker is happy to see you here!',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 100),
                      child: Center(
                          child: Text(
                        'New user!! Sign up',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
