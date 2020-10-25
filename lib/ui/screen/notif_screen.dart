import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifScreen extends StatefulWidget {
  @override
  _NotifScreenState createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFe7eaf3).withAlpha(2),
          ),
        ),
        elevation: 6,
        backgroundColor: Color(0xFFFFFFFF),
        shadowColor: Color(0xFFFFFFFF),
        title: Text(
          "Notifikasi",
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            // padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ListTile(
                  // contentPadding: EdgeInsets.zero,
                  title: Text("Judul Notif"),
                  subtitle: Text("Deskripsi Notifikasi"),
                ),
                Divider()
              ],
            ),
          )
        ],
      )),
    );
  }
}
