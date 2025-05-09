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

class AutomatedViewPagerBloc extends Bloc<AutomatedViewPagerBlocEvent, int> {

  @override
  // TODO: implement initialState
  int get initialState => 0;
  bool looper = false;


  @override
  Stream<int> mapEventToState(AutomatedViewPagerBlocEvent event) async* {
    // TODO: implement mapEventToState
    switch (event){
      case AutomatedViewPagerBlocEvent.start:
        looper = true;
          while(looper){
              await new Future.delayed(new Duration(seconds: 4));
              if (state >= 2) {
                yield 0;
              } else {
                yield state + 1;
              }
          }
          break;
      case AutomatedViewPagerBlocEvent.stop :
        looper = false;
        break;

    }
  }
}

enum AutomatedViewPagerBlocEvent {
  start,
  stop
}