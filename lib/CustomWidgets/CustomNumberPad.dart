/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Resources/Resources.dart';

class CustomNumberPad extends StatefulWidget {

  final void Function(String) onButtonClicked;

  CustomNumberPad({this.onButtonClicked}){

  }
  @override
  _CustomNumberPadState createState() => _CustomNumberPadState(onButtonClicked: onButtonClicked);
}

class _CustomNumberPadState extends State<CustomNumberPad> {

  final void Function(String) onButtonClicked;

  _CustomNumberPadState({this.onButtonClicked}){

  }
   Widget getTextWidget(String text){


    return GestureDetector(
        onTap: (){

          if(onButtonClicked != null) {


            onButtonClicked(text);
          }
        },
        child: Container(

          width: 50,
          height: 50,
          color: Colors.white,
          child: Center(
            child: Text(text,style: TextStyle(
                color: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                fontFamily: R.strings.fontName,
                fontSize: 25,
                fontWeight: FontWeight.w500
            ),),
          ),
        ),);

   }

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: MediaQuery.of(context).size.width,
      height:230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getTextWidget("1"),
              getTextWidget("2"),
              getTextWidget("3"),

            ],
          )

          ,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getTextWidget("4"),
              getTextWidget("5"),
              getTextWidget("6"),
            ],
          )
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getTextWidget("7"),
              getTextWidget("8"),
              getTextWidget("9"),
            ],
          )
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              getTextWidget(" "),
              getTextWidget("0"),
              getTextWidget("<"),

            ],
          )
        ],
      ),
    );
  }
}