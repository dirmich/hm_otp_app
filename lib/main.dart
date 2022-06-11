import 'package:flutter/material.dart';
import 'package:hm_otp_app/ble/ble_main.dart';
import 'package:hm_otp_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Highmaru Authenticator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white38,
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(
                  vertical: PADDING * 1.2, horizontal: PADDING))),
      // home: const AuthScreen(),
      home: const BleMain(),
      // routes: {
      //   "/": ((context) => const LoginPage()),
      //   "/register": ((context) => const RegisterPage())
      // },
    );
  }
}
