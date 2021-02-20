import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:health/screens/bot.dart';
import 'package:health/services/api_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer2/mailer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  static const routeName = '/home';
}

class _HomeScreenState extends State<HomeScreen> {
  final API_Manager apimanagervalue = API_Manager();
  // ignore: non_constant_identifier_names
  final Fireinstance = FirebaseFirestore.instance;
  // ignore: non_constant_identifier_names
  final User = FirebaseAuth.instance.currentUser;
  int tempavg = 0;
  int stepavg = 0;
  int glucoseavg = 0;
  int bodytemperature = 0;
  int bloodPressureavg = 0;
  int respirationavg = 0;
  int heartrateavg = 0;
  int cholesterolavg = 0;
  int oxygenavg = 0;
  int c = 0;
  FToast fToast;
  // ignore: non_constant_identifier_names
  Mail() async {
    var top = new GmailSmtpOptions()
      ..username = 'ppsnandha@gmail.com'
      ..password = 'ppsnandha';
    var emailTransport = new SmtpTransport(top);
    var envelop = new Envelope()
      ..from = 'ppsanandha@gmail.com@gmail.com'
      ..recipients.add('nandhiniperiyasamy5@@gmail.com') //recipent email
      ..ccRecipients.addAll(
          ['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
      ..subject =
          'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'; //subject of the email
    emailTransport.send(envelop).then((envelope) {
      print('Email sent!');
      emailToast("Email Sent!");
    }).catchError((e) => print('Email Error occurred: $e'));
  }

  emailToast(emailtoasttext) {
    if (emailtoasttext == "Sending Health Report") {
      //icon=Icon(Icons.timelapse);
      //color=Colors.lightBlueAccent;
    } else if (emailtoasttext == "Email Sent!") {
      //icon=Icon(Icons.check);
      //color=Colors.lightGreenAccent;
    }
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        //color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 30),
    );
  }

  var greeting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Health tracker'),
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.chat),
            onPressed: () {
              _navigate(context);
            }),
        body: FutureBuilder(
            future: apimanagervalue.getNews(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var healthvalue = snapshot.data;
                //print(user.currentUser.uid);
                Timer.periodic(Duration(seconds: 30), (timer) {
                  Fireinstance.collection('data').add(
                    {
                      "bodytemperature": healthvalue.bodyTemperature,
                      "step_count": healthvalue.steps,
                      "glucose": healthvalue.glucose,
                      "blood_pressure": healthvalue.bloodPressure,
                      "respiration": healthvalue.respiration,
                      "heart_rate": healthvalue.heartRate,
                      "cholestral": healthvalue.cholesterol,
                      "oxygen_level": healthvalue.oxygenSaturation,
                      "uid": User.uid,
                    },
                  );
                });

                Fireinstance.collection("data")
                    .get()
                    .then((QuerySnapshot querySnapshot) => {
                          querySnapshot.docs.forEach((doc) {
                            tempavg = tempavg + doc["bodyTemperature"];
                            stepavg = stepavg + doc["steps"];
                            glucoseavg = glucoseavg + doc["glucose"];
                            bloodPressureavg =
                                bloodPressureavg + doc["bloodPressure"];
                            respirationavg =
                                respirationavg + doc["respiration"];
                            heartrateavg = heartrateavg + doc["heartRate"];
                            cholesterolavg =
                                cholesterolavg + doc["cholesterol"];
                            oxygenavg = oxygenavg + doc["oxygenSaturation"];
                            c++;
                          }),
                          {
                            tempavg = (tempavg ~/ c),
                            stepavg = (stepavg ~/ c),
                            glucoseavg = (glucoseavg ~/ c),
                            bloodPressureavg = (bloodPressureavg ~/ c),
                            respirationavg = (respirationavg ~/ c),
                            heartrateavg = (heartrateavg ~/ c),
                            cholesterolavg = (cholesterolavg ~/ c),
                            oxygenavg = (oxygenavg ~/ c),
                            print('$tempavg'),
                            print('$stepavg'),
                            print('$glucoseavg'),
                            print('$bloodPressureavg'),
                            print('$respirationavg'),
                            print('$heartrateavg'),
                            print('$cholesterolavg'),
                            print('$oxygenavg'),
                            Mail(),
                          }
                        });
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "https://image.freepik.com/free-vector/abstract-low-poly-mesh-background-design_1048-7440.jpg"),
                    fit: BoxFit.fill,
                  )),
                  child: Container(
                    alignment: FractionalOffset.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Body Temperature:",
                            style: GoogleFonts.oswald(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                        Text(healthvalue.bodyTemperature.toString(),
                            style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(fontSize: 22, color: Colors.black),
                            )),
                        Text(
                          "Glucose:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.glucose.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                        Text(
                          "Step Count:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.steps.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                        Text(
                          "Blood Pressure:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.bloodPressure.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                        Text(
                          "Respiration:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.respiration.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                        Text(
                          "Heart Rate:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.heartRate.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                        Text(
                          "Cholestral:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.cholesterol.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                        Text(
                          "Oxygen Level:",
                          style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          healthvalue.oxygenSaturation.toString(),
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            }));
  }

  void _navigate(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Chatbot()));
  }
}
