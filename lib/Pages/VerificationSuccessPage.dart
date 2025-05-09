/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppConstants/LayoutController.dart';
import 'package:flutter_app/Blocks/AutomatedViewPagerBloc.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/Pages/GetStartedPage.dart';
import 'package:flutter_app/Pages/MainHomeTabPage.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_fade/image_fade.dart';

class VerificationSuccessPage extends StatefulWidget {

  VerificationSuccessPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VerificationSuccessPageState createState() => _VerificationSuccessPageState();
}

class _VerificationSuccessPageState extends State<VerificationSuccessPage> {
  final _automatedViewPagerBlock = AutomatedViewPagerBloc();



  @override
  Widget build(BuildContext context) {
    _automatedViewPagerBlock.add(AutomatedViewPagerBlocEvent.start);
    return Scaffold(

      body: Stack(
        children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image(image: AssetImage('assets/images/background_one.png'), fit: BoxFit.fill,)),

            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: LayoutController.getHeight(MediaQuery.of(context).size.height) ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          child: Container(
                            height: 80,
                            child: ImageFade(
                              image :  AssetImage('assets/images/verification_success.png'),
                              fadeDuration: Duration(milliseconds: 2000),
                              fadeCurve: Curves.easeInBack,

                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        )
                        ,

                        Padding(
                          padding:  EdgeInsets.fromLTRB(0,40.0,0,100),
                          child: Text(R.strings.verificationSuccess.toString(),style: TextStyle(
                              color: Colors.white,
                              fontFamily: R.strings.fontName,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),
                        )
                      ],
                    )
                    ,

                  ],
                ),
              ),
            )
        ],
      )
    );
  }

  void startHomeTab() async{
    await new Future.delayed(new Duration(seconds: 4));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainHomeTabPage()),
    );
  }

  @override
  void initState() {
    startHomeTab();
  }


}