import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  var _emailId;
  var _password;

  final emailCl = new TextEditingController();
  final passwordCl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-1.png'))),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-2.png'))),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/clock.png'))),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          "Login!!!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white))),
                        //email
                        child: TextFormField(
                          controller: emailCl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold)),
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              print('invalid email or password');
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value) => _emailId['email'] = value.trim(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        //password
                        child: TextFormField(
                          controller: passwordCl,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.blueGrey)),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          cursorColor: Colors.black,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 5) {
                              print('invalid email or password');
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value) =>
                              _password['password'] = value.trim(),
                        ),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          try {
                            final user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailCl.text.trim(),
                                    password: passwordCl.text.trim());
                            if (user != null) {
                              print("login successfull");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color(0xFF7087F0),
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account ?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF7087F0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

createAlertDialog1(BuildContext context) {
  // ignore: unused_local_variable
  TextEditingController customController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'INVALID LOGIN',
                style: TextStyle(
                    color: Color.fromRGBO(159, 163, 167, 1),
                    fontFamily: 'Arimo',
                    fontSize: 14.5),
              ),
            ],
          ),
          elevation: 20.0,
          //backgroundColor: Color.fromRGBO(34, 45, 54, 1),
        );
      });
}
