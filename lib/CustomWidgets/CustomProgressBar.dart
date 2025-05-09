/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Resources/Resources.dart';

class CustomProgressBar extends StatefulWidget {

  CustomProgressBar(this.greenValue,this.redValue);
  final double greenValue;
  final double redValue;
  @override
  _CustomProgressBarState createState() => _CustomProgressBarState(greenValue,redValue);
}

class _CustomProgressBarState extends State<CustomProgressBar> {

  _CustomProgressBarState(this.greenValue,this.redValue);
  final double greenValue;
  final double redValue;
  @override
  Widget build(BuildContext context) {
    return getCustomProgressWidget(greenValue,redValue);
  }



  Widget getCustomProgressWidget(double greenValue,double redValue){
    double maxwidth = MediaQuery.of(context).size.width - 40;
    double greenValuePercentage = 100 * (greenValue / (greenValue + redValue));
    print(greenValuePercentage);
    double greenValueWidth =  ((maxwidth * greenValuePercentage) / 100);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                color: R.colors.homeRedColor,
              ),
              width: maxwidth,
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                color: R.colors.homeGreenColor,
              ),
              width: greenValueWidth,
            ),
          ],
        ),
      ],
    );
  }
}