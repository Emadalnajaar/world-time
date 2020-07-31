import 'package:flutter/material.dart';
import 'package:worldtime/pages/Home.dart';
import 'package:worldtime/pages/Choose_location.dart';
import 'package:worldtime/pages/Loading.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' :(context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    }
  ));
}
