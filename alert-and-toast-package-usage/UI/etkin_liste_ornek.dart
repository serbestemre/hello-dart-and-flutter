import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//english words kütüphanesiyle rastgele kelime üretip öğrenci adı olarak kullanacağız

import 'package:fluttertoast/fluttertoast.dart';

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
              onTap: () {
                toastMessageGoster(index);
                alertDialogGoster(context);
              },
              onLongPress: () {
                toastMessageGoster(index);
              },
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

  void toastMessageGoster(int index) {
    Fluttertoast.showToast(
        msg: "${tumOgrenciler[index]}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void alertDialogGoster(BuildContext ctx) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text("ALERT DIALOG BASLIK"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
              Text("Alert diyalog içeriği1"),
              Text("Alert diyalog içeriği2"),
              Text("Alert diyalog içeriği3"),
              Text("Alert diyalog içeriği4"),
              Text("Alert diyalog içeriği5"),
              Text("Alert diyalog içeriği5"),
              Text("Alert diyalog içeriği5"),
              Text("Alert diyalog içeriği5"),
                ],
              ),
            ),
            actions: <Widget>[
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text("Tamam"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text("Kapat"),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

}

class Ogrenci {
  String _isim;
  String _aciklama;

  Ogrenci(this._isim, this._aciklama); // Constructor
}
