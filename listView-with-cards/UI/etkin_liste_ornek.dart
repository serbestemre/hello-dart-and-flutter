import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//english words kütüphanesiyle rastgele kelime üretip öğrenci adı olarak kullanacağız

class EtkinListeOrnek extends StatelessWidget {
  List<Ogrenci> tumOgrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrenciVerileriniGetir();
    // TODO: implement build
    return ListView.separated(
        separatorBuilder: (context, index) {
          if (index % 4 == 0 && index != 0) {
            // her 5 elemandan sonra bir ayraç görevi gören container çiz
            return Container(
              color: Colors.black,
              height: 2,
              margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
            );
          } else {
            return Container();
          }
        },
        itemCount: 20,
        // itemBuilder: (context, index) => Card());
        itemBuilder: (context, index) {
          return Card(
            color: index % 2 == 0
                ? Colors.indigo.shade100
                : Colors.indigoAccent.shade100,
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(tumOgrenciler[index]._isim),
              subtitle: Text(tumOgrenciler[index]._aciklama),
              trailing: Icon(Icons.add),
            ),
          );
        });
  }

  void ogrenciVerileriniGetir() {
    /**
     * Ogrenci sınıfından ogrenci nesneleri üreterek
     * 300 Elemanlı bir liste oluşturur
     *  */

    tumOgrenciler = List.generate(
        300,
        (index) => Ogrenci(
              "${WordPair.random()}",
              // WordPair Sınıfını kullanarak Öğrenci Adı alanına rastgele bir kelime atanıyor.
              "Öğrenci Numarası: $index ",
            ));
  }
}

class Ogrenci {
  String _isim;
  String _aciklama;

  Ogrenci(this._isim, this._aciklama); // Constructor
}
