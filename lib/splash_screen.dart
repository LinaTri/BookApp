// ignore_for_file: unused_import, use_key_in_widget_constructors, must_call_super

import 'dart:async';
import './splash_screen.dart';
import 'package:book_app/view/book_list_page.dart';
import 'package:flutter/material.dart';
//import './views/book_list_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BookListPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.pink,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 137, 2, 56),
                  fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/book.png'),
            //Center(child: FlutterLogo(size: 300)),
            const Text(
              'BOOK APP',
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 137, 2, 56),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'ANYEONG',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 137, 2, 56),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
