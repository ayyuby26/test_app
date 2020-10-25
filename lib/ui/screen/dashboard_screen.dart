import 'package:ant_icons/ant_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_app/ui/templates.dart' as input;

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final searchCtrl = TextEditingController();

  final searchFN = FocusNode();
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
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "FilmQ",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(AntIcons.notification_outline),
            onPressed: () {
              Get.toNamed('/notif');
            },
          ),
          IconButton(
            icon: Icon(AntIcons.user),
            onPressed: () {
              Get.toNamed('/profile');
            },
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                childAspectRatio: 0.58,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(140, 152, 164, .075),
                              blurRadius: 10)
                        ],
                        border: Border.all(
                            color: Color.fromRGBO(231, 234, 243, .7)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.all(10),
                    // height: 600,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(
                                "https://m.media-amazon.com/images/M/MV5BYWY2ZmIzYTUtZGVmMC00MjAyLWJmNWQtNmVlYmYxNDQyOGQzXkEyXkFqcGdeQXVyNzc4MjM0MDk@._V1_SX300.jpg",
                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                // scale: 0.1,
                                loadingBuilder:
                                    (context, child, loadingProgress) => Center(
                                  child: child,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "The Man Who Turned to Stone",
                                    style: GoogleFonts.sourceSansPro(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "2020",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                                                  child: Material(
                          type: MaterialType.transparency,
                          color: Colors.transparent,
                            child: InkWell(
                            splashColor: Colors.white.withOpacity(.7),
                              onTap: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //   SafeArea(
      //   child: WillPopScope(
      // onWillPop: onWillPop,
    );
  }
}
