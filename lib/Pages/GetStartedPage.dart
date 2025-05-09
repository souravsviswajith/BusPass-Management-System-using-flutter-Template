/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppConstants/LayoutController.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/CustomWidgets/CustomTextField.dart';
import 'package:flutter_app/Pages/LoginPage.dart';
import 'package:flutter_app/Resources/Resources.dart';

class GetStartedPage extends StatefulWidget {

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {


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

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:  EdgeInsets.fromLTRB(20,30.0,0,0),
                          child: Text(R.strings.welcomeText,style: TextStyle(
                              color: Colors.white,
                              fontFamily: R.strings.fontName,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                        Padding(
                          padding:  EdgeInsets.fromLTRB(20,15.0,50,0),
                          child: Text(R.strings.welcomDescription, textAlign: TextAlign.left, style: TextStyle(
                              color: Colors.white,
                              fontFamily: R.strings.fontName,
                              fontSize: 17,
                              fontWeight: FontWeight.w300
                          ),),
                        )
                        ,
                      ],
                    )
                    ,

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
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

                            Container(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                                child: CustomTextField(hintText: R.strings.userName,topHintText: R.strings.userNameTop,)


                            ),

                            Container(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                                child: CustomTextField(hintText: R.strings.email,topHintText: R.strings.emailTop,)

                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                                child: CustomTextField(hintText: R.strings.mobileNumber,topHintText: R.strings.mobileNumberTop,)

                            )
                            ,
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,18.0,0,30),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: MediaQuery.of(context).size.width - 40,
                                  child: CustomRaisedButton(text: R.strings.getStarted,
                                    color: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage()),
                                      );

                                    },),
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(R.strings.alreadyHaveAnAccount, style: TextStyle(
                                      color: R.colors.textHintColor,
                                      fontFamily: R.strings.fontName,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400
                                  ),)
                                  , GestureDetector(
                                    onTap: (){},
                                    child: Text(R.strings.logIn, style: TextStyle(
                                        color: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                                        fontFamily: R.strings.fontName,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400
                                        ),),
                                  )
                                ],
                              ),
                            )
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