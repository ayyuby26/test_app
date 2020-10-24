import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          "Profile",
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          // width: 120,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            // border: Border.all(),
                            shape: BoxShape.circle,
                            color: Color(0xFFFEFEFE),
                            // borderRadius: BorderRadius.circular(80),
                          ),
                          margin: EdgeInsets.all(40),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 3,
                                color: Color(0xFFefefef),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(30),
                              child: Icon(
                                AntIcons.user,
                                size: 80,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 45,
                          right: 45,
                          child: IconButton(icon: Icon(AntIcons.camera,size: 40,), onPressed: () {}))
                      ],
                    ),
                  ListTile(
                    title: Text("Nama"),
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
