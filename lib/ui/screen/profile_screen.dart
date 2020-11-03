import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/viewmodel/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthProvider auth;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthProvider>(context);
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
                    SizedBox(height: 20,),
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
                            subtitle: Text(auth.user.fullname ?? "-"),
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
                            subtitle: Text(auth.user.email ?? "-"),
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
                        onPressed: () {
                          onWillPop();
                        },
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

  Future<bool> onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Container(
            child: Text("Apakah anda yakin ingin keluar ?"),
          ),
          actions: [
            FlatButton(
              onPressed: Get.back,
              child: Text("Batal"),
            ),
            FlatButton(
              onPressed: () {
                auth.setEmail(null);
                auth.setUser(null);
                auth.setPass(null);
                Get.offAllNamed("/");
              },
              child: Text("Keluar"),
            ),
          ],
        );
      },
    );
  }
}
