import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/model/pokedex.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;



  PokemonDetail({this.pokemon});

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PaletteGenerator paletteGenerator;
  Color baskinRenk = Colors.deepOrange;
  Color darkBaskin = Colors.deepOrange;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        NetworkImage(widget.pokemon.img));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
        darkBaskin = paletteGenerator.darkVibrantColor.color;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baskinRenk,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baskinRenk,
        title: Text(
          widget.pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        },
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 15,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.02,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Text(
                  widget.pokemon.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height : " + widget.pokemon.height,
                ),
                Text(
                  "Weight : " + widget.pokemon.weight,
                ),
                Text(
                  "Types : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type
                      .map((tip) => Chip(
                          backgroundColor: darkBaskin,
                          label: Text(
                            tip.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )))
                      .toList(),
                ),
                Text(
                  "Pre Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.prevEvolution != null
                      ? widget.pokemon.prevEvolution
                          .map((evolution) => Chip(
                              backgroundColor: darkBaskin,
                              label: Text(
                                evolution.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )))
                          .toList()
                      : [Text("İlk Hali")],
                ),
                Text(
                  "Next Evolution",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.nextEvolution != null
                      ? widget.pokemon.nextEvolution
                          .map((evolution) => Chip(
                              backgroundColor: darkBaskin,
                              label: Text(
                                evolution.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )))
                          .toList()
                      : [
                          Text(
                            "Son Hali",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection:Axis.horizontal ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses
                            .map((weakness) => Chip(
                                backgroundColor: darkBaskin,
                                label: Text(
                                  weakness
                                      .toString()
                                      .substring(5, weakness.toString().length),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )))
                            .toList()
                        : [
                            Text(
                              "Zayıflığı yok",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                widget.pokemon.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-20,
      height: MediaQuery.of(context).size.height*3/4,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
                tag: widget.pokemon.img,
                child: Container(
                  width: 200,

                  child: Image.network(
                    widget.pokemon.img,
                    fit: BoxFit.fill,
                  ),
                )),
          ),Expanded(
            flex: 4,
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                  ),
                  Text(
                    "Types : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type
                        .map((tip) => Chip(
                        backgroundColor: darkBaskin,
                        label: Text(
                          tip.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.prevEvolution != null
                        ? widget.pokemon.prevEvolution
                        .map((evolution) => Chip(
                        backgroundColor: darkBaskin,
                        label: Text(
                          evolution.name,
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        )))
                        .toList()
                        : [Text("İlk Hali")],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.nextEvolution != null
                        ? widget.pokemon.nextEvolution
                        .map((evolution) => Chip(
                        backgroundColor: darkBaskin,
                        label: Text(
                          evolution.name,
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        )))
                        .toList()
                        : [
                      Text(
                        "Son Hali",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.weaknesses != null
                        ? widget.pokemon.weaknesses
                        .map((weakness) => Chip(
                        backgroundColor: darkBaskin,
                        label: Text(
                          weakness
                              .toString()
                              .substring(5, weakness.toString().length),
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        )))
                        .toList()
                        : [
                      Text(
                        "Zayıflığı yok",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
            ) ,
          )
        ],
      ),
    );
  }
}
