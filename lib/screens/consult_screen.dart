import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../doctors/DokterA.dart';
import '../doctors/DokterB.dart';
import '../doctors/DokterC.dart';
import '../doctors/DokterD.dart';
import '../doctors/DokterE.dart';
import '../doctors/DokterF.dart';
import 'home_screen.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({Key? key}) : super(key: key);

  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  Widget build(BuildContext context) {
    final dokterAButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) =>  DokterA()));
        },
        child: Text(
          "Dokter A",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final dokterBButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => DokterB()));
        },
        child: Text(
          "Dokter B",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final dokterCButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => DokterC()));
        },
        child: Text(
          "Dokter E",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final dokterDButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => DokterD()));
        },
        child: Text(
          "Dokter D",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final dokterEButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => DokterE()));
        },
        child: Text(
          "Dokter E",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final dokterFButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(this.context).size.width,
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => DokterF()));
        },
        child: Text(
          "Dokter F",
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
                  child: Image.asset(
                    'assets/smartcat.png',
                    fit: BoxFit.fill,
                  ),
                  height: 210,
                  width: 1000,
                ),
                SizedBox(
                  child: Text(
                    "MENU UTAMA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  height: 60,
                ),
                // Text(
                //   'MENU UTAMA',
                //   style: TextStyle(fontWeight: FontWeight.bold,
                //     fontSize: 30.0,
                //   ),
                // ),
                dokterAButton,
                SizedBox(
                  height: 15,
                ),
                dokterBButton,
                SizedBox(
                  height: 15,
                ),
                dokterCButton,
                SizedBox(
                  height: 15,
                ),
                dokterDButton,
                SizedBox(
                  height: 15,
                ),
                dokterEButton,
                SizedBox(
                  height: 15,
                ),
                dokterFButton,
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                SizedBox(
                  height: 15,
                ),
                ActionChip(
                    label: Text("Kembali"),
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
        MaterialPageRoute(builder: (context) => MenuUtama()));
  }
}
