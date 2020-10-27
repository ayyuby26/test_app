import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/viewmodel/corona_provider.dart';
import 'package:test_app/core/viewmodel/notif_provider.dart';
import 'package:test_app/ui/screen/dashboard_screen.dart';
import 'package:test_app/ui/screen/login_screen.dart';
import 'package:test_app/ui/screen/notif_screen.dart';
import 'package:test_app/ui/screen/profile_screen.dart';
import 'package:test_app/ui/screen/register_screen.dart';
import 'core/viewmodel/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.init("7f10cb7f-7578-41bd-8e36-f87b5520aa6c", iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CoronaProvider()),
        ChangeNotifierProvider(create: (_) => NotifProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    super.initState();
  }

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
        GetPage(
            name: '/profile',
            page: () => ProfileScreen(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/notif',
            page: () => NotifScreen(),
            transition: Transition.rightToLeft),
      ],
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colours.aliceBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
