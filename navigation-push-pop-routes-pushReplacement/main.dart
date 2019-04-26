import 'package:first_flutter_app/UI/custom_scroll_view.dart';
import 'package:first_flutter_app/UI/etkin_liste_ornek.dart';
import 'package:first_flutter_app/UI/gesture_detector.dart';
import 'package:first_flutter_app/UI/grid_view_kullanimi.dart';
import 'package:first_flutter_app/UI/liste_dersleri.dart';
import 'package:first_flutter_app/UI/navigasyon_islemleri.dart';
import 'package:first_flutter_app/UI/sliver_list_builder.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    title: "Navigation",
    routes: {
      '/'      : (context) => NavigasyonIslemleri(), // programın başlangıç (kök) dizini belirtiliyor.
      '/GPage' : (context) => GSayfasi(),
      '/HPage' : (context) => HSayfasi(),
    },
  //  home: NavigasyonIslemleri(),  // rota olarak kök dizin tanımlandığı için burda home: kısmı tanımlanamaz.
  ));
}
