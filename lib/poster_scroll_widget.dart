import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:philia/constants.dart';
import 'package:philia/db.dart';
import 'package:philia/question.dart';


class PosterScrollWidget extends StatelessWidget {
  final double currentPage;
  final String cat;

  final padding = 5.0;
  final hiddenPosterVerticalInset = 10.0;

  PosterScrollWidget(this.cat, this.currentPage);

  @override
  Widget build(BuildContext context) {
    final db = DB();
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

          var heightDiferenceRatio = heightOfPrimaryPoster/(heightOfPrimaryPoster + hiddenPosterVerticalInset*2);

          var primaryPosterLeft = safeWidth -
              widthOfPrimaryPoster; //this value is the empty space to the left of the "primary" poster
          var hiddenPosterHorizontalInset = primaryPosterLeft /
              2; //two posters in the stack should be visible to the left of the "primary", divide that space evenly
          //note that this implementation is arbitrary. I divided it into two because I thought it looked good
          //but you could give it a fixed offset in pixels, and just have the "stack" fill in that space

          var posters = <Widget>[];
          for (var i = 0; i < data.length; i++) {
            var question = data[i];
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
              key: Key(question),
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
                  //Scaffold.of(context).showSnackBar(SnackBar(content: Text('You clicked $question')));
                  Navigator.pushNamed(context, '/qcard',
                    arguments: Question(index: i, cat: cat),
                  );
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
                      child: Hero(
                        tag: 'questioncard' + cat + i.toString(),
                        child: Material(
                          type: MaterialType.transparency,
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
                                        cat,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22 - 22*((1-heightDiferenceRatio) * -deltaFromCurrentPage),
                                            fontStyle: FontStyle.italic,
                                            color: LIGHT_GREY),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(15.0),
                                      height: heightOfPrimaryPoster - (-deltaFromCurrentPage * hiddenPosterVerticalInset),
                                      width: widthOfPrimaryPoster - (-deltaFromCurrentPage * hiddenPosterHorizontalInset),
                                      child: Text(db.questions[cat][i], textAlign: TextAlign.center, style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 26 - 26*((1-heightDiferenceRatio) * -deltaFromCurrentPage)
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


double clamp(double val, double min, double max) {
  if (val < min) return min;
  if (val > max) return max;
  return val;
}