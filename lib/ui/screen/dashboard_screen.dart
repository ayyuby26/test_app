import 'package:ant_icons/ant_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Konfirmasi"),
            content: Container(
              child: Text("Apakah anda yakin ingin keluar?"),
            ),
            actions: [
              FlatButton(
                onPressed: Get.back,
                child: Text("Batal"),
              ),
              FlatButton(
                onPressed: SystemNavigator.pop,
                child: Text("Keluar"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
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
          "Dunia dalam aplikasi",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(AntIcons.notification_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(AntIcons.user),
            onPressed: () {
              Get.toNamed('/profile');
            },
          )
        ],
      ),
      body: SafeArea(
          child: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          child: Column(
            children: [],
          ),
        ),
      )),
    );
  }
}
