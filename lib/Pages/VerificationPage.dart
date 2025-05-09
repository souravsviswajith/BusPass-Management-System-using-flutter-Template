/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppConstants/LayoutController.dart';
import 'package:flutter_app/Blocks/UpdateOtpBloc.dart';
import 'package:flutter_app/CustomWidgets/CustomNumberPad.dart';
import 'package:flutter_app/CustomWidgets/CustomOtpTextField.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/CustomWidgets/CustomTextField.dart';
import 'package:flutter_app/Pages/MainHomeTabPage.dart';
import 'package:flutter_app/Pages/VerificationSuccessPage.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationPage extends StatefulWidget {

  VerificationPage({this.title,this.phoneNumber}) {
    
  }
  final String title;
  final String phoneNumber;

  @override
  _VerificationPageState createState() => _VerificationPageState(phoneNumber: phoneNumber,title: title);
}

class _VerificationPageState extends State<VerificationPage> {

  _VerificationPageState({this.title,this.phoneNumber}) {

  }
  final String title;
  final String phoneNumber;

  final UpdateOtpBloc counterBloc = UpdateOtpBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image(image: AssetImage('assets/images/background_one.png'), fit: BoxFit.fill,)),
            ),

            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: LayoutController.getHeight(MediaQuery.of(context).size.height),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Padding(
                      child: Container(
                        height: 52,
                        child: Image(image: AssetImage('assets/images/logo.png'), fit: BoxFit.fill,),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    )
                    ,
                    Container(
                      width: 270,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.fromLTRB(20,30.0,0,0),
                            child: Text(R.strings.welcomeTextLogin,style: TextStyle(
                                color: Colors.white,
                                fontFamily: R.strings.phoneVerification,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                          Padding(
                            padding:  EdgeInsets.fromLTRB(20,15.0,0,0),
                            child: Text(R.strings.sendVerificationto + (phoneNumber ?? " +91 12345678909"), textAlign: TextAlign.left, style: TextStyle(
                                color: Colors.white,
                                fontFamily: R.strings.fontName,
                                fontSize: 17,
                                fontWeight: FontWeight.w300
                            ),),
                          )
                          ,
                        ],
                      ),
                    )
                    ,
                          Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: CustomOtpTextField(counterBloc: counterBloc,)
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      decoration: BoxDecoration(
                        color: R.colors.whiteMainColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)
                        )
                      ),
                      width: MediaQuery.of(context).size.width,

                        child: Column(

                          children: <Widget>[

                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: CustomNumberPad(
                                  onButtonClicked: (String str){
                                    counterBloc.add(UpdateOtpBlocEvent(string: str));
                                  },
                                ),
                            
                            ),

                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,18.0,0,0),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: MediaQuery.of(context).size.width - 40,
                                  child: CustomRaisedButton(text: R.strings.done,
                                    color: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => VerificationSuccessPage()),
                                      );
                                    },),
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 50),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,18.0,0,30),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: MediaQuery.of(context).size.width - 40,
                                  child: CustomRaisedButton(text: R.strings.resendCode,
                                    color: Colors.white,
                                    borderColor: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                                    textColor: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                                    onPressed: (){},),
                                ),
                              ),
                            ),

                          ],
                        ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

}