import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _email;
  var _password;
  var _name;
  final nameCl = new TextEditingController();
  final emailCl = new TextEditingController();
  final passwordCl = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 350,
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
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
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
                        margin: EdgeInsets.only(top: 90),
                        child: Center(
                          child: Text(
                            "Sign Up!!!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
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
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: nameCl,
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle:
                                      TextStyle(color: Colors.blueGrey)),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              validator: (value) =>
                                  value.isEmpty ? 'name can\'t be empty' : null,
                              onSaved: (value) => _name['name'] = value.trim(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: emailCl,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(color: Colors.blueGrey)),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => value.isEmpty
                                  ? 'Email can\'t be empty'
                                  : null,
                              onSaved: (value) {
                                _email['email'] = value.trim();
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: passwordCl,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      TextStyle(color: Colors.blueGrey)),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              cursorColor: Colors.black,
                              obscureText: true,
                              validator: (value) => value.isEmpty
                                  ? 'Password can\'t be empty'
                                  : null,
                              onSaved: (value) {
                                _password['password'] = value.trim();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              print('Signed up');
                              auth
                                  .createUserWithEmailAndPassword(
                                      email: emailCl.text.trim(),
                                      password: passwordCl.text.trim())
                                  .then((value) => {
                                        FirebaseAuth.instance.currentUser
                                            .updateProfile(
                                          displayName: nameCl.text.trim(),
                                        ),
                                      });
                              print("before it");

                              print("after it");

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
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
                          Text("Already an user ?"),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF7087F0),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
