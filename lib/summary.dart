import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'db.dart';

class Summary extends Dialog{
  int i;
  String cat;
  Summary(this.i,this.cat);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(0, 150, 0, 150),
      title: Text(DB().questions[cat][i]),
      content: Container(
          height: 600,
          width: double.infinity,
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5,1],
              colors: [
                Color(0xFFFFF5FA),
                Colors.white,
                Color(0xFFFEEBF4),
              ],
            ),
          ),*/
          //alignment: Alignment.topCenter,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Text(
                    DB().summaries[cat][i],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(20, 10, 10, 1.0),
                        fontWeight: FontWeight.w400,
                        fontSize: 20
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}