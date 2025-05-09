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
import 'package:flutter_app/Blocks/MaxMinHomeScreenBloc.dart';
import 'package:flutter_app/CustomWidgets/CustomHomeMaximisedData.dart';
import 'package:flutter_app/CustomWidgets/CustomHomeMinimisedData.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/CustomWidgets/CustomTextField.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../LoginPage.dart';
import '../VerificationPage.dart';

class ProfileTabPage extends StatefulWidget {
  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: AssetImage('assets/images/mask_profile.png'),
                fit: BoxFit.cover,
              )),
        ),

        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: LayoutController.getHeight(
                (MediaQuery.of(context).size.height - 60),
                minHeight: 740),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  decoration: BoxDecoration(
                      color: R.colors.whiteMainColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              R.strings.personalInformation,
                              style: TextStyle(
                                  color: R.colors.homeTextColor,
                                  fontFamily: R.strings.fontName,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: CustomTextField(
                            hintText: R.strings.userName,
                            topHintText: R.strings.userNameTop,
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: CustomTextField(
                            hintText: R.strings.email,
                            topHintText: R.strings.emailTop,
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          child: CustomTextField(
                            hintText: R.strings.mobileNumber,
                            topHintText: R.strings.mobileNumberTop,
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 30),
                          child: ButtonTheme(
                            height: 50,
                            minWidth: MediaQuery.of(context).size.width - 40,
                            child: CustomRaisedButton(
                              text: R.strings.logOut,
                              color: R.colors
                                  .splashScreenViewPagerSelectedIndicatorColor,
                              onPressed: () {},
                            ),
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
    ));
  }
}
