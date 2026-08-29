import 'package:contactsapp/screens/home.dart';
import 'package:contactsapp/screens/splash.dart';
import 'package:contactsapp/utils/AppRoutes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ContactsApp());
}
class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:AppRoutes.splashScreen,
      routes: {
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.homeScreen: (context) => const HomeScreen(),

      },
    );
  }
}
