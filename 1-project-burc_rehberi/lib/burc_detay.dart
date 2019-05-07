import 'package:burc_rehberi/burc_liste.dart';
import 'package:burc_rehberi/models/burc.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatelessWidget {
  int gelenIndex;
  Burc secilenBurc;

  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[gelenIndex];

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            primary: true,
            expandedHeight: 250,
            backgroundColor: Colors.indigo,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenBurc.burcBuyukResim, fit: BoxFit.cover,),
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri", style: TextStyle(fontSize: 14),),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Text(secilenBurc.burcDetayi, style: TextStyle(fontSize: 12, color:Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
