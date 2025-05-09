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
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {

  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          child: Container(
                            height: 52,
                            child: Image(image: AssetImage('assets/images/logo.png'), fit: BoxFit.fill,),
                          ),
                          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        )
                        ,

                        Padding(
                          padding:  EdgeInsets.fromLTRB(0,20.0,0,0),
                          child: Text(R.strings.appName,style: TextStyle(
                            color: Colors.white,
                            fontFamily: R.strings.fontName,
                            fontSize: 28,
                            fontWeight: FontWeight.w600
                          ),),
                        )
                        ,


                        BlocBuilder(
                         bloc: _automatedViewPagerBlock,
                         builder: (context,int i){

                           return Padding(
                             padding:  EdgeInsets.fromLTRB(0,100.0,0,0),
                             child: AnimatedSwitcher(
                               duration: Duration(milliseconds: 2000),
                               child: Text(R.strings.splashScreenViewPagerHeader[i].toString(), key : Key(i.toString()),style: TextStyle(
                                   color: Colors.white,
                                   fontFamily: R.strings.fontName,
                                   fontSize: 20,
                                   fontWeight: FontWeight.w500
                               ),),
                             ),
                           );

                         },
                        )
                        ,
                        BlocBuilder(
                          bloc: _automatedViewPagerBlock,
                        builder: (context,int i){

                          return Padding(
                            padding:  EdgeInsets.fromLTRB(30,25.0,30,0),
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 2000),
                              child: Text(R.strings.splashScreenViewPagerDescription[i].toString(), key: Key(i.toString()), textAlign: TextAlign.center, style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: R.strings.fontName,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300
                              ),),
                            ),
                          );
                          }

                        )
                        ,
                        Padding(
                          padding:  EdgeInsets.fromLTRB(30,25.0,30,0),
                          child: getViewPagerIndicator()
                        )
                      ],
                    )
                    ,
                    Column(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ButtonTheme(
                           height: 50,
                           minWidth: MediaQuery.of(context).size.width - 60,
                           child: CustomRaisedButton(
                             color: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                             text: R.strings.getStarted,
                             onPressed: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => GetStartedPage()),
                               );
                             },
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(0,18.0,0,80),
                         child: ButtonTheme(
                           height: 50,
                           minWidth: MediaQuery.of(context).size.width - 60,
                           child: CustomRaisedButton(text: R.strings.logIn, onPressed: (){},),
                         ),
                       ),
                     ],
                    )
                  ],
                ),
              ),
            )
        ],
      )
    );
  }


  Widget getViewPagerIndicator(){
   return BlocBuilder(
      bloc: _automatedViewPagerBlock,
      builder: (context,int i){
        return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0.0,5,0),
              child: Container(
                width: (i==0) ? 8 : 5,
                height: (i==0) ? 8 : 5,

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (i==0) ? R.colors.splashScreenViewPagerSelectedIndicatorColor : R.colors.splashScreenViewPagerUnselectedIndicatorColor),
              ),
            )
            ,
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0.0,5,0),
              child: Container(
                width: (i==1) ? 8 : 5,
                height: (i==1) ? 8 : 5,

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (i==1) ? R.colors.splashScreenViewPagerSelectedIndicatorColor : R.colors.splashScreenViewPagerUnselectedIndicatorColor),
              ),
            )
            ,
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0.0,5,0),
              child: Container(
                width: (i==2) ? 8 : 5,
                height: (i==2) ? 8 : 5,

                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (i==2) ? R.colors.splashScreenViewPagerSelectedIndicatorColor : R.colors.splashScreenViewPagerUnselectedIndicatorColor),
              ),
            )
          ],
        );
      },
    );
  }
}