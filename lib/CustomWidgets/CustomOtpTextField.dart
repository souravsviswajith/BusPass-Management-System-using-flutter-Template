/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Blocks/UpdateOtpBloc.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOtpTextField extends StatefulWidget {

  CustomOtpTextField({this.counterBloc}){

  }

  final UpdateOtpBloc counterBloc;

  @override
  _CustomOtpTextFieldState createState() => _CustomOtpTextFieldState(counterBloc: counterBloc);
}

class _CustomOtpTextFieldState extends State<CustomOtpTextField> {

   _CustomOtpTextFieldState({this.counterBloc}){

  }

  final UpdateOtpBloc counterBloc;
  String otp = "";
  Widget getOneCell({String string}){
    return Container(
      width: 30,
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(string ?? "•",style: TextStyle(
              color: R.colors.whiteMainColor,
              fontFamily: R.strings.fontName,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),),
          Container(
            width: 30,
            height: 2,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BlocBuilder(
            bloc: counterBloc,
            builder: (context,List<String> str){

              return getOneCell(string: str[0]);
            },
          condition: (previousState, state) {
            print(previousState[0] +" " + state[0]);
              if(previousState[0] != state[0]){


                return false;
              }
              return true;
          },

        ),
        BlocBuilder(
          bloc: counterBloc,
          builder: (context,List<String> str){
            return getOneCell(string: str[1]);
          },
        ),
        BlocBuilder(
          bloc: counterBloc,
          builder: (context,List<String> str){
            return getOneCell(string: str[2]);
          },
        ),
        BlocBuilder(
          bloc: counterBloc,
          builder: (context,List<String> str){
            return getOneCell(string: str[3]);
          },
        ),
        BlocBuilder(
          bloc: counterBloc,
          builder: (context,List<String> str){
            return getOneCell(string: str[4]);
          },
        ),
        BlocBuilder(
          bloc: counterBloc,
          builder: (context,List<String> str){
            return getOneCell(string: str[5]);
          },
        ),
      ],
    );
  }
}