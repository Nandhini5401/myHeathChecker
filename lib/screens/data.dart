//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(DataScreen());
// }

class DataScreen extends StatefulWidget {
  static const routeName = '/data';
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  Color primaryColor = Color(0xff10203d);

  Map data;

  // addData() {
  //   Map<String, dynamic> demoData = {"name": "The Growing Developer"};
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection('path');
  //   collectionReference.add(demoData);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.blue,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'Data Operations on health using firestore',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 70,
              ),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: (){},
                color: Colors.black26,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 30),
                      Text('Add Data',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ]),
                textColor: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                data.toString(),
                textAlign: TextAlign.center,
              ),
            ])));
  }
}
