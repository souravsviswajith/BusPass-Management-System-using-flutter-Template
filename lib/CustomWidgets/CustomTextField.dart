/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Resources/Resources.dart';

class CustomTextField extends StatefulWidget {
  String hintText;
  String topHintText;
  void Function() callback;
  CustomTextField({this.hintText,this.topHintText,this.callback}){
  }


  @override
  _CustomTextFieldState createState() => _CustomTextFieldState(hintText: hintText,topHintText: topHintText, callback: callback);
}

class _CustomTextFieldState extends State<CustomTextField> {


  String hintText;
  String topHintText;
  void Function() callback;
  _CustomTextFieldState({this.hintText,this.topHintText,this.callback}){

  }

  @override
  Widget build(BuildContext context) {
    return  Container(


      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
          color:  R.colors.textBackgroundColor),
      child: Column(

        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 3, 0, 0),
            child: Text(topHintText ?? "",style: TextStyle(color: R.colors.textHintColor),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextField(

              decoration: new InputDecoration(

                  hintText: hintText ?? "",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,

                contentPadding: const EdgeInsets.symmetric(vertical: 1.0),

            ),
            ),
          ),
        ],
      ),
    );
  }
}