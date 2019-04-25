import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as matematik;

class SliverListKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //title: Text("Sliver APP Bar", style: TextStyle(color: Colors.red,),),
          backgroundColor: Colors.red,
          expandedHeight: 300,
          floating: false,
          //scroll işlemi tam olarak bitmeden app bar görünmeye başlar.
          snap: false,
          // floating ile birlikte true kullanılmalı!!! Sayfanın en altından üste doğru scroll hareketine başlandığı anda app bar aşşağıya doğru tamamen açılıyor.
          pinned: true,
          // app bar kapandıktan sonra banner gibi üstte görünmeye devam eder
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Banner Başlık!"),
            centerTitle: true,
            background: Image.asset(
              "assets/images/sample2.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(4),
          sliver: SliverList(
            delegate: SliverChildListDelegate(sabitListeElemanlari("SliverList, SliverChildListDelegate ")),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 10),
          ),
        ),

        SliverFixedExtentList(delegate:SliverChildListDelegate(
          sabitListeElemanlari("SliverFixedExtentList, ChildList Delegate"), //Widget(container) içeren bir Liste döndüren method
        ) , itemExtent: 300,),

        SliverFixedExtentList(delegate:SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 6),itemExtent: 50,),

    //Sabit elemanlarla bir satırda kaç eleman olacağını belirlediğimiz grid türü
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) , // satırda gösterilecek eleman sayısı
          delegate: SliverChildListDelegate(sabitListeElemanlari("SliverGrid, SliverGridDelegateWithFixedCrossAxisCount ")) ,
        ),

        //dinamik (builder ile üretilen) elemanlarla bir satırda kaç eleman olacağını belirlediğimiz grid türü
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) , //satırda gösterilecek eleman sayısı
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon, childCount: 6) , // toplamda oluşturlacak eleman sayısı
        ),


        //dinamik (builder ile üretilen) elemanlarla bir satırdaki elemanın genişlik değerini belirttiğimiz grid türü

        SliverGrid(gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
        childCount: 6),
        ),
      ],
    );
  }

  List<Widget> sabitListeElemanlari(String listeTuru) {
    return [
      Container(
        height: 100,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.indigo,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.lightGreen,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 100,
        color: Colors.redAccent,
        alignment: Alignment.center,
        child: Text(
          "$listeTuru Sabit Elemanı",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
      child: Text(
        "$index Dinamik Liste Elemanı",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255),
        matematik.Random().nextInt(255) // argb colors
        );
  }
}
