import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_news/constants.dart';
import 'package:your_news/services/function.dart';

class bottomsheet extends StatefulWidget {
  const bottomsheet({Key? key}) : super(key: key);

  @override
  _bottomsheetState createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  static Future<void>_openlink(String link)async {
    var urllink=link;
    if(await canLaunch(urllink))
    {
      await launch(urllink);
    }
    else{
      await launch(urllink);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  "Help",
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.clear),
                color: black,
              ),
            ],
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("if any error or problem happen please contact us",style: TextStyle(fontSize: size4),),
              ),
              Text("our link : ",style: TextStyle(fontSize: size4),),
              GestureDetector(
                onTap: (){
                  _openlink("https://www.facebook.com/sayed.rady.3720/");
                },
                child: Text("Sayed Rady",style: TextStyle(fontSize: size4,color: Colors.blueAccent),),
              ),

            ],
          )
        ],
      ),
    );
  }
}
