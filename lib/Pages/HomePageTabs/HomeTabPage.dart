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
import 'package:flutter_app/CustomWidgets/CustomHomeMaximisedData.dart';
import 'package:flutter_app/CustomWidgets/CustomHomeMinimisedData.dart';
import 'package:flutter_app/CustomWidgets/CustomRaisedButton.dart';
import 'package:flutter_app/CustomWidgets/CustomTextField.dart';
import 'package:flutter_app/Resources/Resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../VerificationPage.dart';

class HomeTabPage extends StatefulWidget  {

  HomeTabPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> with TickerProviderStateMixin{
  final _maxMinHomeScreenBloc = MaxMinHomeScreenBloc();
  String _mapStyle;
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(39.42796133580664, -122.085749655962),
    zoom: 8.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(39.42796133580664, -122.085749655962),
      zoom: 2.151926040649414);

  Set<Marker> marker = {};


  @override
  void dispose() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 60,
                  color: R.colors.loginButtonColor,
                  child:FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: 1000)),
                    builder: (context ,snapshot){
                      return GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        markers: marker ,

                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                          setMapStyle();
                        },
                      );
                    },

                  ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                           margin: EdgeInsets.fromLTRB(20, 30, 20, 0)
                          ,child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(R.strings.arrivalInformation,style: TextStyle(
                                  color: R.colors.homeTextColor,
                                  fontFamily: R.strings.fontName,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500
                              ),),
                              Container(
                                height: 40,
                                child:
                                  BlocBuilder(
                                      bloc: _maxMinHomeScreenBloc,
                                      builder: (context,bool i){

                                        if(!i) {
                                          return GestureDetector(
                                              onTap: (){
                                                _maxMinHomeScreenBloc.add(MaxMinHomeScreenBlocEvent.minimise);
                                                //_goToTheLake();
                                              },
                                              child: AnimatedSwitcher(
                                                  duration: Duration(milliseconds: 500),
                                                  transitionBuilder: (Widget child, Animation<double> animation) {
                                                    return ScaleTransition(scale: animation,child: child,);
                                                  },
                                                  child: Image(key: Key("img_1"),image: AssetImage('assets/images/fold_down_icon.png'), fit: BoxFit.fill,)));
                                        }else{
                                          return GestureDetector(
                                              onTap: (){
                                                _maxMinHomeScreenBloc.add(MaxMinHomeScreenBlocEvent.maximise);

                                              },
                                              child: AnimatedSwitcher(
                                                  duration: Duration(milliseconds: 500),
                                                  transitionBuilder: (Widget child, Animation<double> animation) {
                                                    return  ScaleTransition(scale: animation,child: child,);
                                                  },
                                                  child: Image( key: Key("img_2"),image: AssetImage('assets/images/fold_up_icon.png'), fit: BoxFit.fill,)));
                                        }
                                      }
                                  )
                              ),
                            ],
                          )
                        ),
                        BlocBuilder(
                            bloc: _maxMinHomeScreenBloc,
                            builder: (context,bool i){
                               return AnimatedContainer(
                                 height: (!i) ?160 : 40,
                                 onEnd: (){

                                 },
                                 duration: Duration(milliseconds: 320),
                                   child: (!i) ? CustomisedHomeMaximisedData():CustomisedHomeMinimisedData()
                               )
                               ;
                            }
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  void setMapStyle() async{
    final GoogleMapController controller = await _controller.future;
    controller.setMapStyle(_mapStyle);
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));

  }

  void createMarker() async{
     BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)), "assets/images/car_blue.png");

     marker.add(Marker(
       rotation: 30,
       markerId: MarkerId("dsf"),
        position:  LatLng(39.42796133580664, -122.085749655962),
        icon:  bitmapDescriptor,
      ));

  }
  @override
  void initState() {
    createMarker();
    rootBundle.loadString('assets/mapstyles/map_style.txt').then((string) {
      _mapStyle = string;
    });



  }
}