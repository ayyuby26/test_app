import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:test_app/core/viewmodel/corona_provider.dart';
import 'package:test_app/core/viewmodel/notif_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  formatted(String s) {
    return NumberFormat("#,##0", "id").format(int.parse(s));
  }

  final searchCtrl = TextEditingController();

  final searchFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CoronaProvider>(context);
    final getAdd = value.addition.update.coronaAddModel;
    final getTot = value.total.update.coronaAddModel;

    card(String title, valueTitle, subTitle, valueSubTitle) {
      return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(140, 152, 164, .075),
                blurRadius: 10,
              )
            ],
            border: Border.all(
              color: Color.fromRGBO(231, 234, 243, .7),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FlatButton(
              onPressed: () {
                // Provider.of<NotifProvider>(context)
                //     .setNotif("title", "message", "image", "url");
                // print(Provider.of<NotifProvider>(context).notif);
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xFF8c98a4),
                        ),
                      ),
                    ),
                    Text(
                      value != null ? formatted(valueTitle) : "",
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      subTitle,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Color(0xFF8c98a4),
                        ),
                      ),
                    ),
                    Text(
                      valueSubTitle != null ? formatted(valueSubTitle) : "",
                      style: GoogleFonts.mukta(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );
    }

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
          "Corona Di Indonesia",
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
              tooltip: "notifikasi",
              icon: Icon(AntIcons.notification_outline),
              onPressed: () {
                Get.toNamed("/notif");
                // print(Provider.of<NotifProvider>(context).notif.length);
              }),
          IconButton(
            tooltip: "profile",
            icon: Icon(AntIcons.user),
            onPressed: () {
              Get.toNamed('/profile');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 5),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hari ini",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat('EEEE, d MMMM y', 'id')
                          .format(DateTime.now())
                          .toString(),
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                childAspectRatio: 1,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  card(
                    "POSITIF",
                    getAdd.positiveTotal.toString(),
                    'Total Positif',
                    getTot.positiveTotal.toString(),
                  ),
                  card(
                    "SEMBUH",
                    getAdd.recoveredTotal.toString(),
                    'Total Sembuh',
                    getTot.recoveredTotal.toString(),
                  ),
                  card(
                    "DIRAWAT",
                    getAdd.treatedTotal.toString(),
                    'Total Dirawat',
                    getTot.treatedTotal.toString(),
                  ),
                  card(
                    "MENINGGAL",
                    getAdd.deadTotal.toString(),
                    'Total Meninggal',
                    getTot.deadTotal.toString(),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terakhir diperbarui",
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF8c98a4),
                        ),
                      ),
                    ),
                    Text(
                      value.addition.update.coronaAddModel.created,
                      style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
