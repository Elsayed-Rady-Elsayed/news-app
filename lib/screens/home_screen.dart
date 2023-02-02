import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_news/constants.dart';
import 'package:your_news/services/api.dart';
import 'package:your_news/services/function.dart';
import 'package:your_news/widgets/catogriesbutton.dart';

import 'bottomsheet.dart';

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  bool staricon = false;
  static Future<void> _openlink(String link) async {
    var urllink = link;
    if (await canLaunch(urllink)) {
      await launch(urllink);
    } else {
      await launch(urllink);
    }
  }

  static Future<void> _sharelink(String link) async {
    Share.share(link);
  }

  static Future<void> _copylink(String link) async {
    FlutterClipboard.copy(link).then((value) => print('copied'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 80)),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 0, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          color: red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15))),
                          child: Text(
                            "Egypt",
                            style: TextStyle(
                              color: background,
                              fontSize: size9,
                            ),
                          )),
                      Text(
                        "news",
                        style: TextStyle(
                          color: black,
                          fontSize: size9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 30)),
              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: IconButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return bottomsheet();
                  });
                }, icon: Icon(Icons.info_outlined),color: black,),
              ),
            ],
          ),

          //catogrie title
          Padding(
            padding: const EdgeInsets.only(top: 7, left: 5, bottom: 7),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Choose Your Catogries",
                style: TextStyle(fontSize: size7, color: text),
              ),
            ),
          ),
          //the list view
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                catogries_button("General", red),
                catogries_button("Science", cyan),
                catogries_button("Health", ornage),
                catogries_button("Sports", green,),
                catogries_button("Business", yellow),
                catogries_button("Technology", black),
                catogries_button("Entertainment", blue),
              ],
            ),
          ),
          //small title
          Padding(
            padding: const EdgeInsets.only(top: 7.5, left: 7, bottom: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "the most reached",
                style: TextStyle(fontSize: size5, color: text),
              ),
            ),
          ),

          Expanded(
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: Api.getarticals(),
                  builder:
                      (BuildContext context,  snapshot) {  /// في ايروور هنا اني اكتب ال اسينكرونس متنساش
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                              onTap: () {
                                _openlink(
                                    "${snapshot.data[i].url}");
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Container(
                                          height: 200,
                                          decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                image: NetworkImage((snapshot.data[i].urlToImage==null)?"https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png"
                                                    :"${snapshot.data[i].urlToImage}"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  topLeft:
                                                      Radius.circular(10))),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text((snapshot.data[i].title==null)?"title not avilable"
                                          :"${snapshot.data[i].title}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: black,
                                              fontWeight: FontWeight.w100,
                                            fontSize: size5
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3)),
                                      Container(
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10))),
                                          color: red,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  _sharelink(
                                                      "${snapshot.data[i].url}");
                                                },
                                                icon: Icon(Icons.share),
                                                color: iconcolor,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10)),
                                              IconButton(
                                                onPressed: () {
                                                  final snackBar = SnackBar(
                                                      content:
                                                          Text('Link Copied'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                  _copylink(
                                                      "${snapshot.data[i].url}");
                                                },
                                                icon: Icon(Icons.copy),
                                                color: iconcolor,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10)),
                                              IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                      context) {
                                                        return bottomsheet();
                                                      });
                                                },
                                                icon: Icon(Icons.info_outline),
                                                color: iconcolor,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10)),
                                              IconButton(
                                                color: star,
                                                onPressed: () {
                                                  if (staricon == false) {
                                                    setState(() {
                                                      staricon = true;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      staricon = false;
                                                    });
                                                  }
                                                },
                                                icon: (staricon == false)
                                                    ? Icon(Icons.star_border)
                                                    : Icon(Icons.star),
                                                iconSize: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                      );
                    } else {
                      return Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: red,
                          ),
                        ),
                      );
                    }
                  },
                )),
          ),
        ],
      ),
    ));
  }
}
