import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:philia/constants.dart';
import 'package:philia/my_gradient_app_bar.dart';
import 'package:philia/poster_scroll_widget.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double currentPage = data.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: data.length - 1);
    controller.addListener(() {
      setState(() {
        controller.jumpToPage(3);
        currentPage = controller.page;

      });
    });

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: myGradientAppBar(),
        //backgroundColor: new Color(0xFF736AB7),
        body: SafeArea(
          child: Container(
            //color: Color(0xFFE3D8F3),
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    BACKGROUND_PURPLE_GREY,
                    Colors.white,
                    BACKGROUND_PURPLE_GREY,
                  ],
                )),
            child: ListView(

              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child:
                    Container(
                      width: (MediaQuery.of(context).size.width*0.90<500?MediaQuery.of(context).size.width*0.90:500),
                      child: PagerGestureDetector(
                          min: 0,
                          max: (data.length - 1).toDouble(),
                          builder: (currentPage) {
                            return PosterScrollWidget("Ethics", currentPage);
                          }),
                    ),
                ),
                SizedBox(height: 15,),
                Container(
                  alignment: Alignment.center,
                  child:
                  Container(
                    width: (MediaQuery.of(context).size.width*0.90<500?MediaQuery.of(context).size.width*0.90:500),
                    child: PagerGestureDetector(
                        min: 0,
                        max: (data.length - 1).toDouble(),
                        builder: (currentPage) {
                          return PosterScrollWidget("Morals", currentPage);
                        }),
                  ),
                ),
                //this demo doesn't include the movie title, but you could implement that using a very similar setup to the poster stack
                //put each title in a Stack. offset them based on distance from the "current" title in the list.
                //prev goes up by the height of the Stack, next goes down by the same
                //and just don't add anything to the Stack that isn't adjacent to the current item.
              ],
            ),
          ),
        ));
  }
}

class PagerGestureDetector extends StatefulWidget {
  PagerChildBuilder builder;
  double min;
  double max;

  @override
  State createState() => PagerGestureDetectorState();

  PagerGestureDetector({this.builder, this.min, this.max});
}

typedef PagerChildBuilder = Widget Function(double);

//This class is a gesturedetector specifically for pager-like widgets.
//It's pretty simple, you drag, and it calls your builder to build its children
class PagerGestureDetectorState extends State<PagerGestureDetector>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  var page = 0.0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _controller.addListener(() {
      _updatePage(_animation.value);
    });

    super.initState();
  }

  void _animate(double current, double to) {
    _animation = _controller
        .drive(Tween(begin: current, end: clamp(to, widget.min, widget.max)));
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onHorizontalDragUpdate: (dt) {
          var width = context.size.width;
          _updatePage(this.page - (dt.primaryDelta / width));
        },
        onHorizontalDragEnd: (dt) {
          if (dt.primaryVelocity / context.size.width > 5) { // you're swiping to the previous page with some velocity
            _animate(page, (page - 0.5).roundToDouble()); //animate to the previous page (subtracing 0.5 ensures that, if you're on
            // page 1.1, you'll jump to 0.6, which still rounds to 1, rather than subtracting 1, which would put you at 0.1, rounding to 0
            // which puts you two pages away from your starting spot.
          } else if (dt.primaryVelocity / context.size.width < -5) { // you're swiping to the next page with some velocity
            _animate(page, (page + 0.5).roundToDouble()); //the same 0.5 principle applies here
          } else {
            _animate(page, (page).roundToDouble()); // no velocity, so animate to nearest page
          }
        },
        child: Stack(children: [ //you can get rid of this stack, I'm just keeping it here for the debugging text
          widget.builder.call(page),
          //Text("current page: ${this.page}",)
        ]));
  }

  //all calls to update page position should go through this method to
  //ensure page never leaves the bounds set by the user.
  //you could leave this unbounded to have infinite scrolling
  void _updatePage(double page) {
    var min = widget.min;
    var max = widget.max;
    setState(() {
      this.page = clamp(page, min, max);
    });
  }
}
