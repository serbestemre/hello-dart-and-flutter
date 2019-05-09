import 'package:flutter/material.dart';
import 'dart:convert';

class LocalJsonKullanimi extends StatefulWidget {
  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List tumArabalar;

  @override
  void initState() {
    // TODO: implement initState
    debugPrint("init State Çalıştı");

    veriKaynaginiOku().then((gelenArabaObjesi) {
      setState(() {
        tumArabalar = gelenArabaObjesi;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build Çalıştı");

    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: tumArabalar != null ? Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tumArabalar[index]["araba_adi"]),
              subtitle: Text(tumArabalar[index]["ulke"]),
            );
          },
          itemCount: tumArabalar.length,
        ),
      ) : Center(child: CircularProgressIndicator(),)
    );
  }

  Future<List> veriKaynaginiOku() async {
    /*

   Future<String> jsonOku =  DefaultAssetBundle.of(context).loadString("assets/araba.json");

   jsonOku.then((okunanJson){
     debugPrint("gelen json: $okunanJson");
     return okunanJson;
   });

   */

    var gelenVeri =
        await DefaultAssetBundle.of(context).loadString(("assets/araba.json"));
    debugPrint(gelenVeri);
    List arabaListesi = json.decode(gelenVeri.toString());
    debugPrint("toplam araba sayısı: " + arabaListesi.length.toString());

    debugPrint("__________");

    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka: " + arabaListesi[i]["araba_adi"].toString());
      debugPrint("Ülkesi: " + arabaListesi[i]["ulke"].toString());
    }

    return arabaListesi;
  }
}
