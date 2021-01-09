import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philia/my_gradient_app_bar.dart';
import 'package:philia/question.dart';
import 'package:philia/summary.dart';
import 'constants.dart';
import 'db.dart';
import 'package:just_audio/just_audio.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

class QCard extends StatefulWidget {


  QCardState createState() => new QCardState();

}



class QCardState extends State<QCard>{
  PlayerState _playerState;
  /*YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'K18cpp_-gP8',
    params: YoutubePlayerParams(
      playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
      desktopMode: false,
      autoPlay: false,
    ),
  );*/


  @override
  Widget build(BuildContext context) {
    //_controller.onEnterFullscreen = (){print("hey");};
    final Question args = ModalRoute.of(context).settings.arguments;
    int i = args.index;
    String cat = args.cat;

    //final player = AudioPlayer();
    //var duration = await player.setUrl('https://foo.com/bar.mp3');



    return Scaffold(
        appBar: myGradientAppBar(),
      body: ListView(children: [
        Hero(
          tag: 'questioncard' + cat + i.toString(),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: (){showDialog(
                  context: context, builder: (BuildContext context){
                    return Summary(i, cat);
                  }
              );
              },
              child: Ink(
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
                  //alignment: Alignment.topCenter,
                  child: Wrap(
                    children: [Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.all(5.0),
                          child: Text(DB().questions[cat][i], textAlign: TextAlign.center, style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 26
                          ),),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0,0,15,0),
                          child: Text(
                            DB().summaries[cat][i],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14
                            ),
                          ),
                        )
                      ],
                    )],
                  )
              ),
            ),
          ),
        ),
        webStack(_launchURL),
        videoStack(_launchURL),
        /*YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),*/
      ],
      )
    );
  }
  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url,forceWebView: false,enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}

Widget webStack(_launchURL){
  return InkWell(
    onTap: _launchURL,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 30,right:30),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: BACKGROUND_DARK_BLUE,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(1, 3))],
            ),
            height: 200,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Center(
                child: Text("This is a text exsplaing why this article is great an"
                  "all of those things, hope it helps a bit",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 300,
          top: 30,
          child:Image(
            alignment: Alignment.topRight,height: 120,image: AssetImage('assets/images/browser.png'))
        )
      ],
    ),
  );
}

Widget videoStack(_launchURL){
  return InkWell(
    onTap: _launchURL,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 30,right:30),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: DARK_RED,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(1, 3))],
            ),
            height: 200,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Center(
                child: Text("This is a text exsplaing why this video is great canal for learning"
                    "all of those things, hope it helps a bit",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 280,
            top: 30,
            child:Image(
                alignment: Alignment.topRight,height: 120,image: AssetImage('assets/images/video.png'))
        )
      ],
    ),
  );
}