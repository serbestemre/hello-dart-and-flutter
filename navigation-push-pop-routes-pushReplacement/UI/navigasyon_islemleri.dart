import 'package:flutter/material.dart';

class NavigasyonIslemleri extends StatelessWidget {
  String baslik = "B SAYFASI!";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        debugPrint("OnWillPop Çalıştı!!!!");
        Navigator.pop(context, false);
        return Future.value(
            false); // sayfayı geri döndürüyor fakat geri dönen değişken olarak false gönderiyor.
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Navigasyon İşlemleri",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "A Sayfasına Git",
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.indigo,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ASayfasi()),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "B Sayfasına Git ve Veri Gönder",
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BSayfasi(baslik)),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "C Sayfasına Git ve Geri Gel",
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CSayfasi()),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "D Sayfasına Git ve Gelirken Veri Getir",
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.cyan,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DSayfasi()),
                  ).then((donenDeger) {
                    debugPrint(
                        "pop işleminden sonra dönen değer => $donenDeger");
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  "E Sayfasına Git",
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.green.shade600,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ESayfasi()));
                },
              ),
              RaisedButton(
                child: Text(
                  "H Sayfasına Route Kullanarak Git",
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.pushNamed(context, "/HPage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ASayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ASayfasi",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "A Sayfası",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ],
          ),
        ));
  }
}

class HSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "H Sayfasi",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "H Sayfası",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ],
          ),
        ));
  }
}

class FSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "F Sayfasi",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "F Sayfası",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              RaisedButton(
                child: Text(
                  "G Sayfasına\n pushReplacement ile Git",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                color: Colors.pink,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      //pushReplacement methodu gidilecek sayfayı stackın en üstünde bulunan sayfayla yer değiştirir.
                      //bundan dolayı normal şartlarda düşünüldüğünde geri butonuyla 2 önceki adıma dönülmüş gibi olur.
                      MaterialPageRoute(builder: (context) => GSayfasi()));
                },
              ),
            ],
          ),
        ));
  }
}

class GSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "G Sayfasına Hoşgeldin!",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(

                "G Sayfası\n\nEğer bu sayfaya E->F sayfası üzerinden geldiysen geriye dönerken F sayfasına uğramayacaksın çünkü\nGelirken pushReplacement Methodunu kullandın\nŞuanki Stack düzenin (navigasyon,ESayfası,Gsayfası)",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  "Bir Önceki Sayfaya Geri Dön",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.pop(
                      context); // stack teki bir önceki sayfaya geri dönüyor.
                },
              )
            ],
          ),
        ));
  }
}

class BSayfasi extends StatelessWidget {
  String gelenBaslikVerisi;

  BSayfasi(this.gelenBaslikVerisi);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            gelenBaslikVerisi,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                gelenBaslikVerisi,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ],
          ),
        ));
  }
}

class CSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "C Sayfası",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "C Sayfası",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              RaisedButton(
                color: Colors.purple,
                child: Text(
                  "Geri Dön",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.pop(
                      context); // stack teki bir önceki sayfaya geri dönüyor.
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "A sayfasına git!",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ASayfasi())); // stack teki bir önceki sayfaya geri dönüyor.
                },
              )
            ],
          ),
        ));
  }
}

class DSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "D Sayfası",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "D Sayfası",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text(
                  "Geri Dön ve Veri Gönder",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.pop(context,
                      true); // stack teki bir önceki sayfaya geri dönüyor.
                  //true demek ürün silindi. // false ürün silinemedi veya kullanıcı vazgeçti
                },
              ),
            ],
          ),
        ));
  }
}

class ESayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "E Sayfasi",
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "E Sayfası",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text(
                  "F Sayfasına Git!",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FSayfasi()));
                },
              )
            ],
          ),
        ));
  }
}
