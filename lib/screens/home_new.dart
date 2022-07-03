import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tolongbisa/screens/consult_screen.dart';
import 'package:tolongbisa/screens/diskusi.dart';
import 'package:tolongbisa/screens/jenis_kucing.dart';
import 'package:tolongbisa/screens/penyakit_kucing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tolongbisa/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constant/color.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/smartcat.png', fit: BoxFit.fitWidth),
            backgroundColor: warna,
            actions: [
              SizedBox.fromSize(
                size: Size(56, 56),
                child: ClipOval(
                  child: Material(
                    color: warna,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_circle_sharp),
                          Text("${loggedInUser.firstName}",style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(this.context,
              //         MaterialPageRoute(builder: (context) => MenuUtama()));
              //   },
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Icon(
              //         Icons.account_circle_sharp,
              //         size: 24.0,
              //       ),
              //       Text("${loggedInUser.firstName}"),
              //       SizedBox(
              //         width: 5,
              //       ),
              //     ],
              //   ),
              // ),
              // IconButton(
              //     icon: Icon(Icons.account_circle_sharp),
              //     onPressed: () {}),
              // Container(
              //     child: Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text("${loggedInUser.firstName}",
              //       style: TextStyle(color: Colors.red)),
              // ))
            ],
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(40.0),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      _textField(),
                      _buildButton(context),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

Widget _textField() {
  return Column(
    children: <Widget>[
      Text(
        'MENU UTAMA',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 70.0),
      ),
    ],
  );
}

Widget _buildButton(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 20.0),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => JenisKucing()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Text(
            'JENIS KUCING',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PenyakitKucing()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Text(
            'PENYAKIT KUCING',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Discussions()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Text(
            'FORUM DISKUSI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ConsultationScreen()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Text(
            'KONSULTASI DOKTER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    ],
  );
}
