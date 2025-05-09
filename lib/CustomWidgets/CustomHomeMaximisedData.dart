/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Resources/Resources.dart';

class CustomisedHomeMaximisedData extends StatefulWidget {

  CustomisedHomeMaximisedData({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomisedHomeMaximisedDataState createState() => _CustomisedHomeMaximisedDataState();
}

class _CustomisedHomeMaximisedDataState extends State<CustomisedHomeMaximisedData> {


  @override
  Widget build(BuildContext context) {
    return getMaximisedWidget();
  }



  Widget getMaximisedWidget(){
    return   SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(R.strings.arrivalTime,style: TextStyle(
                    color: Colors.black,
                    fontFamily: R.strings.fontName,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("00:00 PA",style: TextStyle(
                      color: R.colors.homeGreenColor,
                      fontFamily: R.strings.fontName,
                      fontSize: 38,
                      fontWeight: FontWeight.w500
                  ),),
                ),
              ],
            ),
            Container(

              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(R.strings.date,style: TextStyle(
                          color: Colors.black,
                          fontFamily: R.strings.fontName,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      Text("Tommarow",style: TextStyle(
                          color: R.colors.homeRedColor,
                          fontFamily: R.strings.fontName,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(R.strings.truckType,style: TextStyle(
                          color: Colors.black,
                          fontFamily: R.strings.fontName,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      Text("Wet",style: TextStyle(
                          color: Colors.black,
                          fontFamily: R.strings.fontName,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}