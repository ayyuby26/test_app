import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/viewmodel/notif_provider.dart';

class NotifScreen extends StatefulWidget {
  @override
  _NotifScreenState createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {

    final notifProvider = Provider.of<NotifProvider>(context);

    content(int i) => ListTile(
          onTap: () {},
          title: Text(notifProvider.notif[i].title??""),
          subtitle: Text(notifProvider.notif[i].message??""),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
          ),
        );

    final list = Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: notifProvider.notif.length,
          itemBuilder: (context, i) => content(i)),
    );
    
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
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height - 85,
          child: Column(
            children: [
              list,
            ],
          ),
        ),
      ),
    );
  }
}
