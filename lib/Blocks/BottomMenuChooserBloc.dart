/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomMenuChooserBloc extends Bloc<BottomMenuChooserBlocEvent, BottomMenuChooserBlocEvent> {

  @override
  // TODO: implement initialState
  BottomMenuChooserBlocEvent get initialState => BottomMenuChooserBlocEvent.home;



  @override
  Stream<BottomMenuChooserBlocEvent> mapEventToState(BottomMenuChooserBlocEvent event) async* {
    // TODO: implement mapEventToState
    yield event;
  }
}

enum BottomMenuChooserBlocEvent {
  home,
  cards,
  history,
  profile

}