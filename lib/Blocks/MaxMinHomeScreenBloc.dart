/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaxMinHomeScreenBloc extends Bloc<MaxMinHomeScreenBlocEvent, bool> {

  @override
  // TODO: implement initialState
  bool get initialState => false;



  @override
  Stream<bool> mapEventToState(MaxMinHomeScreenBlocEvent event) async* {
    // TODO: implement mapEventToState
    switch (event){
      case MaxMinHomeScreenBlocEvent.maximise:
          yield false;
          break;
      case MaxMinHomeScreenBlocEvent.minimise :
         yield true;
         break;
    }
  }
}

enum MaxMinHomeScreenBlocEvent {
  maximise,
  minimise
}