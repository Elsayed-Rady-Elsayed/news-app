import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_news/constants.dart';
import 'package:your_news/screens/catogeries_screen.dart';
class catogries_button extends StatelessWidget {
String? catogriestext;
Color buttoncolor;
  catogries_button(this.catogriestext, this.buttoncolor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: RaisedButton(
          elevation: 3,
          onPressed: (){
            Navigator.push((context), MaterialPageRoute(builder: (context){
              return catogeries_screen(catogriestext!.toLowerCase().toString());
            }));
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
          ),
          child: Text(
            "$catogriestext",
                style: TextStyle(fontSize: size5,color: background,fontWeight: FontWeight.w100),
          ),
          color: buttoncolor,
        ),
      ),
    );
  }
}
