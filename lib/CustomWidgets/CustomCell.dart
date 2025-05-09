/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Models/AmountModel.dart';
import 'package:flutter_app/Resources/Resources.dart';

class CustomCell extends StatefulWidget {

  CustomCell(this.model);
  final AmountModel model;

  @override
  _CustomCellState createState() => _CustomCellState(model);
}

class _CustomCellState extends State<CustomCell> {

  _CustomCellState(this.model);
  final AmountModel model;

  @override
  Widget build(BuildContext context) {
    return getWidget(model);
  }

  Widget getWidget(AmountModel model){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 10, 20),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(

            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Image(image: AssetImage('assets/images/dollar.png'), fit: BoxFit.cover,)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(model.monthText,style: TextStyle(
                        color: R.colors.homeTextColor,
                        fontFamily: R.strings.fontName,

                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(model.transactionTypeText,style: TextStyle(
                        color: R.colors.textHintColor,
                        fontFamily: R.strings.fontName,

                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    )),
                  ),

                ],
              ),


            ],
          ),
          Text(model.amount,style: TextStyle(
              color: model.amountType == AmountType.red ? R.colors.homeRedColor : R.colors.homeGreenColor,
              fontFamily: R.strings.fontName,
              fontSize: 18
          ),)

        ],
      ),
    );
  }


}