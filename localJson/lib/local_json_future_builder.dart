import 'package:flutter/material.dart';
import 'dart:convert';

class LocalJsonWithFuture extends StatefulWidget {
  @override
  _LocalJsonWithFutureState createState() => _LocalJsonWithFutureState();
}

class _LocalJsonWithFutureState extends State<LocalJsonWithFuture> {
  List tumArabalar;

  @override
  void initState() {
    // TODO: implement initState
    debugPrint("init State Çalıştı");

  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build Çalıştı");

    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı"),
      ),
      body: Container(
        child: FutureBuilder(
            future: veriKaynaginiOku(),
            builder: (context, sonuc) {

              if(sonuc.hasData){
                tumArabalar = sonuc.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tumArabalar[index]["araba_adi"]),
                      subtitle: Text(tumArabalar[index]["ulke"]),
                    );
                  },
                  itemCount: tumArabalar.length,
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<List> veriKaynaginiOku() async {
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
