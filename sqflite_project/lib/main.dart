import 'package:flutter/material.dart';
import 'package:sqflite_project/model/ogrenci.dart';
import 'package:sqflite_project/utils/database_helper.dart';

void main() => runApp(MaterialApp(home: SqfLiteIslemleri()));

class SqfLiteIslemleri extends StatefulWidget {
  @override
  _SqfLiteIslemleriState createState() => _SqfLiteIslemleriState();
}

class _SqfLiteIslemleriState extends State<SqfLiteIslemleri> {
  DatabaseHelper databaseHelper;
  var formKey = GlobalKey<FormState>();
  String isim = "";
  int id = 0;
  int tiklanilanListeID;
  bool aktiflik = false;
  List<Ogrenci> tumOgrenciListesi;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var controllerText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumOgrenciListesi = List<Ogrenci>();
    databaseHelper = DatabaseHelper();
    databaseHelper.tumOgrenciler().then((mapListesi) {
      for (Map okunanMap in mapListesi) {
        tumOgrenciListesi.add(Ogrenci.fromMap(okunanMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // _ekle();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("SQFLITE Kullanimi"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: controllerText,
                      decoration: InputDecoration(
                        labelText: "Ogrenci İsmini Girin",
                        border: OutlineInputBorder(),
                      ),
                      validator: (girilenDeger) {
                        if (girilenDeger.length < 3) {
                          return "En az 3 karakter girilmeli!";
                        }
                      },
                      onSaved: (girilenIsim) {
                        isim = girilenIsim;
                      },
                    ),
                  ),
                  SwitchListTile(
                    title: Text("Aktif"),
                    value: aktiflik,
                    onChanged: (aktifMi) {
                      setState(() {
                        aktiflik = aktifMi;
                      });
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Kaydet"),
                  color: Colors.green,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      _ogrenciEkle(Ogrenci(isim, aktiflik));
                      controllerText.clear();
                      aktiflik = false;

                    }
                  },
                ),
                RaisedButton(
                  child: Text("Tüm Kayıtları Sil"),
                  color: Colors.red,
                  onPressed: () {
                    _tumOgrenciKayitlariniSil();
                  },
                ),
                RaisedButton(
                  child: Text("Güncelle"),
                  color: Colors.blue,
                  onPressed: () {
                    isim = controllerText.text;
                    _tumOgrenciGuncelle(
                        Ogrenci.withID(id, isim, aktiflik), tiklanilanListeID);
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tumOgrenciListesi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: tumOgrenciListesi[index].aktif == true
                          ? Colors.green.shade300
                          : Colors.red.shade300,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            aktiflik = tumOgrenciListesi[index].aktif;
                            id = tumOgrenciListesi[index].id;
                            tiklanilanListeID = index;
                            controllerText.text = tumOgrenciListesi[index].isim;
                            ;
                          });
                        },
                        title: Text(tumOgrenciListesi[index].isim),
                        subtitle: Text(tumOgrenciListesi[index].id.toString()),
                        trailing: GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () {
                            databaseHelper
                                .ogrenciSil(tumOgrenciListesi[index].id)
                                .then((silinenID) {
                              setState(() {
                                tumOgrenciListesi.removeAt(index);
                              });
                            });
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  _ogrenciEkle(Ogrenci ogrenci) async {
    await databaseHelper.ogrenciEkle(ogrenci).then((eklenenint) {
      setState(() {
        ogrenci.id = eklenenint;

        tumOgrenciListesi.insert(0, ogrenci);
      });
    });
  }

  void _tumOgrenciKayitlariniSil() async {
    await databaseHelper.tumOgrenciKayitlariniSil().then((silinenElemanSAyisi) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(silinenElemanSAyisi.toString() + " Kayıt silindi."),
          duration: Duration(seconds: 2)));
    });

    setState(() {
      tumOgrenciListesi.clear();
    });
  }

  void _tumOgrenciGuncelle(Ogrenci ogrenci, int tiklanilanListeID) async {
    await databaseHelper.ogrenciGuncelle(ogrenci).then((guncellenenINT) {
      setState(() {
        tumOgrenciListesi[tiklanilanListeID] = ogrenci;
        controllerText.clear();
        aktiflik = false;
      });
    });
  }
/*
  _ekle() async {
    await databaseHelper.ogrenciEkle(Ogrenci("YeniOgrenci", true));
    await databaseHelper.ogrenciEkle(Ogrenci("Emre SERBEST", true));
    var sonuc = await databaseHelper.tumOgrenciler();
    print(sonuc.toString());
    print("Son Öğrenci " + sonuc[0]['isim'].toString());
    databaseHelper.ogrenciSil(null);
  }
  */

}
