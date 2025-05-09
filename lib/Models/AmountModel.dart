/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */

import 'dart:convert';
class AmountModel {

  String monthText;
  String transactionTypeText;
  String amount;
  AmountType amountType;


   AmountModel({String jsonResponse,String monthText,String transactionTypeText,String amount,AmountType amountType }){
    if(jsonResponse != null && jsonResponse.trim() != "") {
      _setData(jsonResponse, this);
      return;
    }

    this.monthText = monthText;
    this.amountType = amountType;
    this.amount = amount;
    this.transactionTypeText = transactionTypeText;


  }

  static AmountModel _setData(String string,AmountModel amountModel){
      try{
          List<dynamic> list = json.decode(string);
          Map<String,dynamic> data = list[0];
          amountModel.monthText = data["monthText"];
          amountModel.transactionTypeText = data["transactionTypeText"];
          amountModel.amount = data["amount"];
          if (data["amountType"] == "red"){
            amountModel.amountType = AmountType.red;
          }else{
            amountModel.amountType = AmountType.green;
          }

      }catch(e){

      }
      return amountModel;
  }

}

enum AmountType{
  red,green
}