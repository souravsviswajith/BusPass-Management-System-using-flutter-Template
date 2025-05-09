/*
 Developer Name : Nikhil I.
 Contact Number : 9496699214
 Contact Email : nikhilishwar2@gmail.com 
 Deveoper : Android/iOS/Flutter
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/AppConstants/LayoutController.dart';
import 'package:flutter_app/Blocks/BottomMenuChooserBloc.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/CustomWidgets/CustomTextField.dart';
import 'package:flutter_app/Pages/HomePageTabs/CardsTabPage.dart';
import 'package:flutter_app/Pages/HomePageTabs/HistoryTabPage.dart';
import 'package:flutter_app/Pages/HomePageTabs/HomeTabPage.dart';
import 'package:flutter_app/Pages/HomePageTabs/ProfileTabPage.dart';
import 'package:flutter_app/Pages/VerificationPage.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeTabPage extends StatefulWidget {


  @override
  _MainHomeTabPageState createState() => _MainHomeTabPageState();
}

class _MainHomeTabPageState extends State<MainHomeTabPage> {



   Widget getMenuItem(String filePath, {double width,BottomMenuChooserBlocEvent event}){
    return  GestureDetector(
      onTap: (){
        _bottomMenuChooserBloc.add(event);
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Container(
            width: width ?? 30,

              child: Image(image: AssetImage(filePath), fit: BoxFit.fill,)
          ),
        ),
      ),
    );
  }

  final BottomMenuChooserBloc _bottomMenuChooserBloc = BottomMenuChooserBloc();
  @override
  Widget build(BuildContext context) {

    print(MediaQuery.of(context).size.height);
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 60,
                  child: BlocBuilder(
                      bloc: _bottomMenuChooserBloc,
                      builder: (context,BottomMenuChooserBlocEvent i){
                        if(i == BottomMenuChooserBlocEvent.home){
                          return   AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),

                              transitionBuilder: (Widget child, Animation<double> animation,) {
                                return ScaleTransition(scale: animation,child: child,);
                              },
                              child: HomeTabPage());
                        }
                        else if(i == BottomMenuChooserBlocEvent.history){
                          return AnimatedSwitcher( duration: Duration(milliseconds: 500),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return ScaleTransition(scale: animation,child: child,);
                              },
                              child: HistoryTabPage());
                        }
                        else if(i == BottomMenuChooserBlocEvent.profile){
                          return AnimatedSwitcher( duration: Duration(milliseconds: 500),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return ScaleTransition(scale: animation,child: child,);
                              },
                              child: ProfileTabPage());
                        }
                        else if(i == BottomMenuChooserBlocEvent.cards){
                          return AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),

                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return ScaleTransition(scale: animation,child: child,);
                              },
                              child: CardsTabPage());
                        }
                        else{
                          return HomeTabPage();
                        }
                      }
                  )
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,

                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[


                    BlocBuilder(
                        bloc: _bottomMenuChooserBloc,
                        builder: (context,BottomMenuChooserBlocEvent i){
                          if(i == BottomMenuChooserBlocEvent.home){
                            return  getMenuItem("assets/images/home_selected_icon.png",event: BottomMenuChooserBlocEvent.home);
                          }else{
                            return  getMenuItem("assets/images/home_unselected_icon.png",event: BottomMenuChooserBlocEvent.home);
                          }
                        }
                    ),
                    BlocBuilder(
                        bloc: _bottomMenuChooserBloc,
                        builder: (context,BottomMenuChooserBlocEvent i){
                          if(i == BottomMenuChooserBlocEvent.cards){
                            return getMenuItem("assets/images/cards_selected_icon.png",event: BottomMenuChooserBlocEvent.cards);
                          }else{
                            return getMenuItem("assets/images/cards_unselected_icon.png",event: BottomMenuChooserBlocEvent.cards);
                          }
                        }
                    ),
                    BlocBuilder(
                        bloc: _bottomMenuChooserBloc,
                        builder: (context,BottomMenuChooserBlocEvent i){
                          if(i == BottomMenuChooserBlocEvent.history){
                            return getMenuItem("assets/images/history_selected_icon.png",event: BottomMenuChooserBlocEvent.history);
                          }else{
                            return getMenuItem("assets/images/history_unselected_icon.png",event: BottomMenuChooserBlocEvent.history);
                          }
                        }
                    ),
                    BlocBuilder(
                        bloc: _bottomMenuChooserBloc,
                        builder: (context,BottomMenuChooserBlocEvent i){
                          if(i == BottomMenuChooserBlocEvent.profile){
                            return getMenuItem("assets/images/profile_selected_icon.png",width: 20,event: BottomMenuChooserBlocEvent.profile);
                          }else{
                            return getMenuItem("assets/images/profile_unselected_icon.png",width: 20,event: BottomMenuChooserBlocEvent.profile);
                          }
                        }
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

}