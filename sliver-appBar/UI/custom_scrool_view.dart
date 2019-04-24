import 'package:flutter/material.dart';

class MyCustomScroolView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //title: Text("Sliver APP Bar", style: TextStyle(color: Colors.red,),),
          backgroundColor: Colors.red,
          expandedHeight: 300,
          floating: true, //scroll işlemi tam olarak bitmeden app bar görünmeye başlar.
          snap: true, // floating ile birlikte true kullanılmalı!!! Sayfanın en altından üste doğru scroll hareketine başlandığı anda app bar aşşağıya doğru tamamen açılıyor.
          pinned: true, // app bar kapandıktan sonra banner gibi üstte görünmeye devam eder
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Banner Başlık!"),
            centerTitle: true,
            background: Image.asset("assets/images/sample2.jpg", fit: BoxFit.cover,),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(sabitListeElemanlari()),
        ),
      ],
    );
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),  Container(
        height: 100,
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),  Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),  Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),  Container(
        height: 100,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),  Container(
        height: 100,
        color: Colors.indigo,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),Container(
        height: 100,
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),Container(
        height: 100,
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),Container(
        height: 100,
        color: Colors.lightGreen,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),Container(
        height: 100,
        color: Colors.redAccent,
        alignment: Alignment.center,
        child: Text("Sabit Liste Elemanı",style: TextStyle(fontSize: 18), textAlign:TextAlign.center,),
      ),
    ];
  }
}
