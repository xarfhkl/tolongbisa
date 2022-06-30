import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolongbisa/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    final konsultasiButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(
              this.context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()));
        },
        child: Text(
          "Konsultasi",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final diskusiButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(
              this.context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()));
        },
        child: Text(
          "Diskusi",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return MaterialApp(
      home: new Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title: Image.asset(
        //     'assets/smartcat.png',
        //     fit: BoxFit.fill,
        //   ),
        // ),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Image.asset('assets/smartcat.png',
                    fit: BoxFit.fill,),
                  height: 210, width: 1000,
                ),
                SizedBox(
                  child: Text("MENU UTAMA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  height: 60,),
                // Text(
                //   'MENU UTAMA',
                //   style: TextStyle(fontWeight: FontWeight.bold,
                //     fontSize: 30.0,
                //   ),
                // ),
                konsultasiButton,
                SizedBox(
                  height: 15,
                ),
                diskusiButton,
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                SizedBox(
                  height: 15,
                ),
                ActionChip(
                    label: Text("Logout"),
                    onPressed: () {
                      logout(context);
                    }),
              ],
            ),
          )),
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}