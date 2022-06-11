import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp/otp.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  String _otp = OTP.generateTOTPCodeString(
      'YQHNWTZPSBE36SMD', DateTime.now().millisecondsSinceEpoch,
      algorithm: Algorithm.SHA1, isGoogle: true);
  _ItemListState() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        _otp = OTP.generateTOTPCodeString(
            'YQHNWTZPSBE36SMD', DateTime.now().millisecondsSinceEpoch,
            algorithm: Algorithm.SHA1, isGoogle: true);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.pink.shade400,
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                drawerItem(icon: Icons.search, text: "Hello"),
                drawerItem(text: "Hello"),
                drawerItem(text: "Hello"),
                drawerItem(text: "Hello"),
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(children: [Text(_otp)]),
        ));
  }

  drawerItem({IconData? icon, String text = ''}) {
    return Row(
      children: [Icon(icon), Text(text)],
    );
  }
}
