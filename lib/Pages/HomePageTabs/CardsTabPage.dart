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

class CardsTabPage extends StatefulWidget {

  CardsTabPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CardsTabPageState createState() => _CardsTabPageState();
}

class _CardsTabPageState extends State<CardsTabPage> {



 static final List<AmountModel> amountModel = [
    AmountModel(amount: "+ \$ 200. 00", transactionTypeText: "Pending Amount", amountType: AmountType.green,monthText: "This Month"),
    AmountModel(amount: "+ \$ 120. 00", transactionTypeText: "Due Amount", amountType: AmountType.red,monthText: "Last Month"),
    AmountModel(amount: "+ \$ 120. 00", transactionTypeText: "Recieve Transaction", amountType: AmountType.red,monthText: "February 2019"),

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
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(

                                  margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                              child: Text("17-17-2019 - 18-17-2020",style: TextStyle(
                                color: Colors.white,
                                fontFamily: R.strings.fontName,
                                fontSize: 18
                              ),)),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(R.strings.amount,style: TextStyle(
                                            color: Colors.white,
                                              fontFamily: R.strings.fontName,
                                              fontSize: 18
                                          ),),
                                          Text("\$ 200. 00",style: TextStyle(
                                              color: R.colors.homeGreenColor,
                                              fontFamily: R.strings.fontName,
                                              fontSize: 18
                                          ),)
                                        ],
                                      ),

                                Row(
                                  children: <Widget>[
                                    Text(R.strings.fine ,style: TextStyle(
                                      color: Colors.white,
                                        fontFamily: R.strings.fontName,
                                        fontSize: 18
                                    ),),
                                    Text("\$ 450. 00",style: TextStyle(
                                        color: R.colors.homeRedColor,
                                        fontFamily: R.strings.fontName,
                                        fontSize: 18
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: CustomProgressBar(200, 450)),

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
                                Text(R.strings.pendingAmount,style: TextStyle(
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
                            height: MediaQuery.of(context).size.height >= 740 ? MediaQuery.of(context).size.height - 480 : 310,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: amountModel.length ,
                              itemBuilder: (context,index){
                                return CustomCell(amountModel[index]);
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,18.0,0,30),
                              child: ButtonTheme(
                                height: 50,
                                minWidth: MediaQuery.of(context).size.width - 40,
                                child: CustomRaisedButton(text: R.strings.payNow,
                                  color: R.colors.splashScreenViewPagerSelectedIndicatorColor,
                                  onPressed: (){

                                  },),
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