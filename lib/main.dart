import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:provider/provider.dart';
import 'package:test_app/ui/screen/dashboard_screen.dart';
import 'package:test_app/ui/screen/login_screen.dart';
import 'package:test_app/ui/screen/profile_screen.dart';
import 'package:test_app/ui/screen/register_screen.dart';
import 'core/viewmodel/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colours.aliceBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
