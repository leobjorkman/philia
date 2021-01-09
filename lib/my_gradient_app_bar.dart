import 'package:flutter/cupertino.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'constants.dart';

Widget myGradientAppBar(){
  return GradientAppBar(
    title: Text('Philia', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: WHITE),),
    gradient: LinearGradient(colors: [APP_BAR_OPACITY_LIGHT_BLUE,APP_BAR_OPACITY_PURPLE, APP_BAR_OPACITY_LIGHT_BLUE]),
    centerTitle: true,
    elevation: 10,
  );

}