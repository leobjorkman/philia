import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:philia/my_gradient_app_bar.dart';
import 'package:philia/question.dart';

import 'constants.dart';
import 'db.dart';

class QCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Question args = ModalRoute.of(context).settings.arguments;
    int i = args.index;
    String cat = args.cat;

    //final player = AudioPlayer();
    //var duration = await player.setUrl('https://foo.com/bar.mp3');

    return Scaffold(
        appBar: myGradientAppBar(),
      body: Column(children: [
        Hero(
          tag: 'questioncard' + cat + i.toString(),
          child: Material(
            type: MaterialType.transparency,
            child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  boxShadow: [BoxShadow(spreadRadius: 0.0,blurRadius: 5.5, color: Colors.black,offset: Offset(2,3))],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Color(colors[i]),
                      Color(colors[(i+1)%(colors.length-1)]),
                      Color(colors[(i+3)%(colors.length-1)]),
                      Color(colors[(i+4)%(colors.length-1)]),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Wrap(
                  children: [Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cat,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              color: LIGHT_GREY),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(DB().questions[cat][i], textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 26
                        ),),
                      ),
                      SizedBox(height: 22,),
                    ],
                  )],
                )
            ),
          ),
        ),
        Container(
          height: 200,
          width: 400,
          child: Text("hola"),
        )
      ],
      )
    );
  }
  
} 