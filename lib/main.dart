import 'package:fish_farm/auth/admin/screen/admin_home_page.dart';
import 'package:fish_farm/auth/admin/screen/login.dart';
import 'package:fish_farm/auth/admin/screen/update_admin_services.dart';
import 'package:fish_farm/auth/admin/screen/update_admin_special_services.dart';
import 'package:fish_farm/auth/config/app_routes.dart';
import 'package:fish_farm/auth/screens/appointment_page.dart';
import 'package:fish_farm/auth/screens/home_page.dart';
import 'package:fish_farm/auth/screens/login.dart';
import 'package:fish_farm/auth/screens/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LOGIN_ROUTE,
      routes: {
        LOGIN_ROUTE: (context) => LoginScreen(),
        REGISTER_ROUTE: (context) => RegisterScreen(),
        HOMEPAGE_ROUTE: (context) => SideNavWidget(),
        APPOINTMENT_ROUTE: (context) => AppointmentScreen(),

        ADMIN_LOGIN_ROUTE: ((context) => AdminLoginScreen()),
        ADMIN_HOME_PAGE:((context) => AdminSideNavWidget()),
        ADMIN_UPDATE_SERVICE:((context) => UpadateServices()),
        ADMIN_UPDATE_SPECIAL_SERVICE:((context) => UpdateSpecialServices())
      },
    );
  }
}
