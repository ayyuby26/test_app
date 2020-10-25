import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/models/auth_model.dart';
import 'package:test_app/core/viewmodel/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final user = auth.user;
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
                            child: IconButton(
                                icon: Icon(
                                  AntIcons.camera,
                                  size: 40,
                                ),
                                onPressed: () {}))
                      ],
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      shadowColor: Colors.blue[50],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            title: Text("Nama"),
                            subtitle: Text(user.fullname ?? "-"),
                          ),
                          Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 2,
                            color: Colors.black12,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            title: Text("Email"),
                            subtitle: Text(user.email ?? "-"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          // side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {},
                        child: Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            child: Text("Keluar",
                                style: TextStyle(
                                  color: Colors.red,
                                ))),
                      ),
                    ),
                    Material(
                        type: MaterialType.transparency,
                        elevation: 6.0,
                        color: Colors.transparent,
                        shadowColor: Colors.grey[100],
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "widget.title",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
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
