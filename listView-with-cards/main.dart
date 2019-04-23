import 'package:first_flutter_app/UI/etkin_liste_ornek.dart';
import 'package:first_flutter_app/UI/liste_dersleri.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    title: "Flutter Dersleri",
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Liste Dersi",
        ),
      ),
      body: EtkinListeOrnek(),
    ),
  ));
}
