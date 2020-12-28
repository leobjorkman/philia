import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

const LIGHT_GREY = Color(0xDDFFFFFF);


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your applfication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*var data = [
  "https://i.imgur.com/tY3sbBZ.jpg",
  "https://cdn.shopify.com/s/files/1/0969/9128/products/Art_Poster_-_Sicario_-_Tallenge_Hollywood_Collection_47b4ca39-2fb6-45a2-9e85-d9ef34016e8a.jpg?v=1505078993",
  "https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg",
  "https://cdn-images-1.medium.com/max/1600/1*H-WYYsGMF4Wu6R0iPzORGg.png",
  "https://static01.nyt.com/images/2017/09/24/arts/24movie-posters1/24movie-posters1-jumbo.jpg",
];*/
/*var data = [
  "assets/images/light.jpg",
  "assets/images/b1.jpg",
  "assets/images/b2.jpg",
  "assets/images/b3.jpg",
  "assets/images/caballo.jpg",
  "assets/images/dark.jpg",
];*/
var data = [
  "What should be the goal of humanity?",
  "What is effective altruism?",
  "Is free will real or just an illusion?",
  "Where is the line between art and not art?",
  "What does it mean to live a good life?",
  "Another question to test something",
  "The third one's going here"
];
var colors = [0xFFf72585,0xFFD61E92,0xFFb5179e,0xFF9410AB,0xFF7209b7,0xFF560bad,0xFF480ca8,0xFF3a0ca3,0xFF3f37c9,0xFF4361ee,0xFF4895ef,0xFF4cc9f0
];

var MOVIE_POSTER_ASPECT_RATIO =
    27.0 / 15.0; //this is the default aspect ratio for a movie poster
//fun fact: movie/TV folks are *extremely* particular about how posters and media are displayed
//like, it'll be in actors' contracts that their face won't be cut off or whatever
//notably, the original design doesn't guarantee this (it scales the poster in and out), but my implementation does, at least for
//standard sized movie posters.
var WIDGET_ASPECT_RATIO = MOVIE_POSTER_ASPECT_RATIO *
    1.1; //this is an arbitrary value I thought looked good. nothing special about it

/*
Rules:
Movie posters must maintain aspect ratio
custom view should maintain fixed aspect ratio, moderately wider than movie poster
 */

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
        appBar: GradientAppBar(
            title: Text('Philia', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),),
            gradient: LinearGradient(colors: [Color(0xFF3366FF), Color(0xFF0DB3FF)]),
            centerTitle: true,

        ),
        backgroundColor: new Color(0xFF736AB7),
        body: SafeArea(
          child: Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF736AB7),
                    Color(0xFF3366FF),
                    Color(0xFF736AB7),
                  ],
                )),
            child: ListView(

              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Column(children: [
                          SizedBox(height: 20),
                          Container(
                            width: (MediaQuery.of(context).size.width*0.90<500?MediaQuery.of(context).size.width*0.90:500),
                            child: PagerGestureDetector(
                                min: 0,
                                max: (data.length - 1).toDouble(),
                                builder: (currentPage) {
                                  return PosterScrollWidget(data, currentPage);
                                }),
                          ),

                      ]
                      ),

                    ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                      children: [
                        Column(children: [
                          SizedBox(height: 20),
                          Container(
                            width: (MediaQuery.of(context).size.width*0.90<500?MediaQuery.of(context).size.width*0.90:500),
                            child: PagerGestureDetector(
                                min: 0,
                                max: (data.length - 1).toDouble(),
                                builder: (currentPage) {
                                  return PosterScrollWidget(data, currentPage);
                                }),
                          ),

                        ]
                        ),
                        /*Positioned(bottom: 0, right: 5,child:
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF208DFF),
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(spreadRadius: 0.0,blurRadius: 1.5, color: Colors.black,offset: Offset(1.5,2))],
                            ),
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: Text(
                              "Morals",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,fontStyle: FontStyle.italic, color: Colors.white),
                            )
                        ),
                        ),*/


                      ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                      children: [
                        Column(children: [
                          SizedBox(height: 20),
                          Container(
                            width: (MediaQuery.of(context).size.width*0.90<500?MediaQuery.of(context).size.width*0.90:500),
                            child: PagerGestureDetector(
                                min: 0,
                                max: (data.length - 1).toDouble(),
                                builder: (currentPage) {
                                  return PosterScrollWidget(data, currentPage);
                                }),
                          ),

                        ]
                        ),
                        /*Positioned(top: 0, right: 5,child:
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF208DFF),
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(spreadRadius: 0.0,blurRadius: 1.5, color: Colors.black,offset: Offset(1.5,2))],
                            ),
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            child: Text(
                              "Ethics",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,fontStyle: FontStyle.italic, color: Colors.white),
                            )
                        ),
                        ),*/

                      ]),
                )
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

class PosterScrollWidget extends StatelessWidget {
  final double currentPage;
  final List<String> data;

  final padding = 5.0;
  final hiddenPosterVerticalInset = 10.0;

  PosterScrollWidget(this.data, this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: WIDGET_ASPECT_RATIO,
        child: LayoutBuilder(builder: (context, constraints) {
          var width = constraints
              .maxWidth; //above aspect ratio ensures fixed width and height
          var height = constraints.maxHeight;

          var safeWidth = width -
              1.5 * padding; //in a "real" implementation, this would be passed in via the constructor
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryPoster = safeHeight;
          var widthOfPrimaryPoster =
              heightOfPrimaryPoster * MOVIE_POSTER_ASPECT_RATIO;

          var primaryPosterLeft = safeWidth -
              widthOfPrimaryPoster; //this value is the empty space to the left of the "primary" poster
          var hiddenPosterHorizontalInset = primaryPosterLeft /
              2; //two posters in the stack should be visible to the left of the "primary", divide that space evenly
          //note that this implementation is arbitrary. I divided it into two because I thought it looked good
          //but you could give it a fixed offset in pixels, and just have the "stack" fill in that space

          var posters = <Widget>[];
          for (var i = 0; i < data.length; i++) {
            var url = data[i];
            var deltaFromCurrentPage = i -
                currentPage; //should be positive if page is to the right, negative if to the left
            var isOnRight = deltaFromCurrentPage > 0;
            if (deltaFromCurrentPage > 1 || deltaFromCurrentPage < -4) {
              continue; //this early return prevents us from adding invisible posters to the hierarchy
            }
            var opacity = 0.0;
            if (deltaFromCurrentPage < 0) {
              //page is off the left
              opacity = clamp(1 + 0.33 * deltaFromCurrentPage, 0, 1);
            } else if (deltaFromCurrentPage < 1) {
              //page is the current page, possibly moving to the right
              opacity = clamp(
                  1 - 2 * (deltaFromCurrentPage - deltaFromCurrentPage.floor()),
                  0,
                  1);
            } else {
              //page is way off the right side, so should be invisible.
              //note: the "continue" above should mean we never get here anyway
              opacity = 0;
            }

            var start = padding +
                max(
                    primaryPosterLeft //default left position for main poster
                        -
                        hiddenPosterHorizontalInset //pages should shift to the left or right as they go "out of focus"
                            *
                            -deltaFromCurrentPage //this value defines how "out of focus" the poster is
                            *
                            (isOnRight ? 15 : 1)
                    //pages should shift much more quickly when going to the right (off the top of the stack) than when going to the left
                    ,
                    0); //ensure the poster is always at least at padding+0

            posters.add(Positioned.directional(
              key: Key(url),
              top: padding +
                  hiddenPosterVerticalInset * max(-deltaFromCurrentPage, 0.0),
              //posters to the left should become smaller,
              //but posters to the right (ones being swiped off the top of the stack) shouldn't become bigger
              bottom: padding +
                  hiddenPosterVerticalInset * max(-deltaFromCurrentPage, 0.0),
              start: start,
              //note that I have not specified an "end" value. The above start, top, and bottom insets, along with the AspectRatio
              //widget below, are enough to define the bounds of the poster properly. the mess of math above ensures that
              //the "end" value calculated by the framework will end up where I want it
              textDirection: TextDirection.ltr,
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('You clicked $url')));
                },
                child: Container(
                  //Items in the stack behind the primary poster should fade into the background
                  //a naive solution would just use opacity, however, that would result in each poster
                  //fading through to the poster behind them. We don't want that, so we give
                  //each poster a white background, which matches the widget background. If this were overtop of black,
                  //or some other color, we'd probably want to use that color instead.
                  //However, we *do* want the top-most poster to fade through to the posters behind it as its being
                  //swiped off the top of the stack, so if it's to the "right", we give it no such white background
                  decoration: deltaFromCurrentPage < 0
                      ? BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10))
                      : BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Opacity(
                    opacity: opacity,
                    child: AspectRatio(
                      aspectRatio: MOVIE_POSTER_ASPECT_RATIO,
                      //This demo doesn't do the hero animation, but flutter makes that super easy.
                      //just wrap this in a Hero widget, give it the movie id as your key, then in the detail
                      //wrap an image in that same key, and it'll just work. Check out my trip demo for an example
                      child: Container(
                        height: heightOfPrimaryPoster,
                        width: widthOfPrimaryPoster,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                                  "Cathegory",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,fontStyle: FontStyle.italic, color: LIGHT_GREY),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(url, textAlign: TextAlign.center, style: TextStyle(
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
                ),
              ),
            ));
          }

          return Stack(
            children: posters,
          );
        }));

    //Stack(children: posters)),
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

double clamp(double val, double min, double max) {
  if (val < min) return min;
  if (val > max) return max;
  return val;
}