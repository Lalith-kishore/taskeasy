import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MpaDetails extends StatefulWidget {

  String lat;
  String long;
  MpaDetails(this.lat,this.long);



  @override
  MpaDetailsState createState() => MpaDetailsState(this.lat,this.long);
}

class MpaDetailsState extends State<MpaDetails> {

  String latitude;
  String longtitude;



  MpaDetailsState(this.latitude,this.longtitude);



  static double? lat;
  static double? long;


  @override
  void initState() {
    setState((){
      print("latitude:"+latitude.toString());
      print("latitude:"+longtitude.toString());

      lat=  double.parse(latitude.toString());
      long=  double.parse(longtitude.toString());
    });
    super.initState();
  }






  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat!,long!),
    zoom: 14.4746,
  );


  static final Marker _kGooglePlexMarker = Marker(markerId: MarkerId('_kGooglePlex'),
  infoWindow: InfoWindow(title: 'Google Plex'),
  icon: BitmapDescriptor.defaultMarker,
  position: LatLng(lat!,long!),);


  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(lat!,long!),//
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override


  Widget build(BuildContext context) {
    print("lat:"+latitude.toString());
    print("lon:"+longtitude.toString());

    return Scaffold(body:GoogleMap(
      mapType: MapType.normal,
      markers: {_kGooglePlexMarker},
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
