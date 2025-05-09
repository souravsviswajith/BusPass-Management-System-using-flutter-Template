/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOtpBloc extends Bloc<UpdateOtpBlocEvent, List<String>> {

  @override
  // TODO: implement initialState
  List<String> get initialState => ["•","•","•","•","•","•"];

  @override
  Stream<List<String>> mapEventToState(UpdateOtpBlocEvent event) async* {
    // TODO: implement mapEventToState

        if(event.string.trim() == "<"){
           yield List.from(removeString(state)) ;
        }
        else if(event.string.trim() == ""){
          yield List.from(state);
        }
        else{
         yield List.from(addString(state, event.string));
        }


  }

  List<String> addString(List<String> str,String data){
    for(int i=0;i< 6;i++){
      if(str[i] == "•"){
        str[i] = data;
        break;
      }
    }

    return str;
  }

  List<String> removeString(List<String> str){
    for(int i=5;i>= 0;i--){
      if(str[i] != "•"){
        str[i] = "•";
        break;
      }
    }
    return str;
  }
}


 class UpdateOtpBlocEvent {
    UpdateOtpBlocEvent({this.string});
    String string;
}

