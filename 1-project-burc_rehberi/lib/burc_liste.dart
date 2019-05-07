import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      Burc yeniOlusturulanBurc = Burc(
        Strings.BURC_ADLARI[i],
        Strings.BURC_TARIHLERI[i],
        Strings.BURC_GENEL_OZELLIKLERI[i],
        Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png", //akrep_8.png
        Strings.BURC_ADLARI[i].toLowerCase() +
            "_buyuk" +
            "${i + 1}.png", //akrep_buyuk8.png
      );
      burclar.add(yeniOlusturulanBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oAnListeyeEklenecekBurc = tumBurclar[index];

    print(oAnListeyeEklenecekBurc.burcAdi +
        "\n" +
        oAnListeyeEklenecekBurc.burcKucukResim);

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          onTap:(){
            Navigator.pushNamed(context, "/burcDetay/$index");
          } ,
          leading: Image.asset(
            "images/" + oAnListeyeEklenecekBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(oAnListeyeEklenecekBurc.burcAdi,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.pink),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical:4.0),
            child: Text(
              oAnListeyeEklenecekBurc.burcTarihi,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.indigoAccent,
          ),
        ),
      ),
    );
  }
}
