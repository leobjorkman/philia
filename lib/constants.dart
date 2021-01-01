import 'dart:ui';

import 'package:flutter/material.dart';

const LIGHT_GREY = Color(0xDDFFFFFF);
const BACKGROUND_TOP_PURPLE = Color(0xFF736AB7);
const BACKGROUND_MID_PURPLE = Color(0xFF3366FF);
const BACKGROUND_PURPLE_GREY = Color(0xFFE3D8F3);
const APP_BAR_LIGHT_BLUE = Color(0x800DB3FF);
const APP_BAR_DARK_BLUE = Color(0x803366FF);
const WHITE = Colors.white;



var MOVIE_POSTER_ASPECT_RATIO =
    27.0 / 15.0; //this is the default aspect ratio for a movie poster
//fun fact: movie/TV folks are *extremely* particular about how posters and media are displayed
//like, it'll be in actors' contracts that their face won't be cut off or whatever
//notably, the original design doesn't guarantee this (it scales the poster in and out), but my implementation does, at least for
//standard sized movie posters.
var WIDGET_ASPECT_RATIO = MOVIE_POSTER_ASPECT_RATIO *
    1.1; //this is an arbitrary value I thought looked good. nothing special about it

var colors = [0xFFf72585,0xFFD61E92,0xFFb5179e,0xFF9410AB,0xFF7209b7,0xFF560bad,0xFF480ca8,0xFF3a0ca3,0xFF3f37c9,0xFF4361ee,0xFF4895ef,0xFF4cc9f0];

var data = [
  "What should be the goal of humanity?",
  "What is effective altruism?",
  "Is free will real or just an illusion?",
  "Where is the line between art and not art?",
  "What does it mean to live a good life?",
  "Another question to test something",
  "The third one's going here"
];
