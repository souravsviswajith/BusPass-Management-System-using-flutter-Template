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
import 'package:flutter_app/CustomWidgets/CustomCell.dart';
import 'package:flutter_app/CustomWidgets/CustomHomeMaximisedData.dart';
import 'package:flutter_app/CustomWidgets/CustomHomeMinimisedData.dart';
import 'package:flutter_app/CustomWidgets/CustomProgressBar.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/CustomWidgets/CustomTextField.dart';
import 'package:flutter_app/Models/AmountModel.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../VerificationPage.dart';

class HistoryTabPage extends StatefulWidget {

  HistoryTabPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HistoryTabPageState createState() => _HistoryTabPageState();
}

class _HistoryTabPageState extends State<HistoryTabPage> {

  static final List<AmountModel> amountModel = [
    AmountModel(amount: "+ \$ 200. 00", transactionTypeText: "Pending Amount", amountType: AmountType.green,monthText: "This Month"),
    AmountModel(amount: "+ \$ 120. 00", transactionTypeText: "Due Amount", amountType: AmountType.green,monthText: "Last Month"),
    AmountModel(amount: "+ \$ 120. 00", transactionTypeText: "Recieve Transaction", amountType: AmountType.green,monthText: "February 2019"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [R.colors.startingGradientColor,R.colors.endGradientColor]
                    )
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: LayoutController.getHeight((MediaQuery.of(context).size.height - 60), minHeight: 740),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(

                              margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                              child: Text(R.strings.myHistory,style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: R.strings.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19
                              ),)),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(R.strings.transactionHistory,style: TextStyle(
                                    color: R.colors.homeTextColor,
                                    fontFamily: R.strings.fontName,

                                    fontSize: 22,
                                    fontWeight: FontWeight.w500
                                ), textAlign: TextAlign.start,),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(25, 20, 20, 0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("2015 - 2021",style: TextStyle(
                                    color: R.colors.textHintColor,
                                    fontFamily: R.strings.fontName,
                                    fontSize: 18
                                ),),

                                Text("- \$ 992. 50" ,style: TextStyle(
                                    color: R.colors.textHintColor,
                                    fontFamily: R.strings.fontName,
                                    fontSize: 18
                                ),)
                              ],
                            ),
                          ) ,

                          Container(
                            height: MediaQuery.of(context).size.height >= 740 ? MediaQuery.of(context).size.height - 260  : 540,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: amountModel.length ,
                              itemBuilder: (context,index){
                                return CustomCell(amountModel[index]);
                              },
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