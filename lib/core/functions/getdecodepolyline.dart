import 'dart:convert';

import 'package:delivery/core/constant/key.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http ;


Future getPolyline(lat , long , destlat , destlong)async{
  Set<Polyline> polylineSet = {} ;
  List<LatLng> polylineco = [] ;
PolylinePoints  polylinePoints = PolylinePoints() ;

String url = "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=$keyGoogleMap" ;

var response = await http.post(Uri.parse(url)) ;
var responsebody = jsonDecode(response.body) ;
var point = responsebody['routes'][0]['overview_polyline']['points'] ;

List<PointLatLng> result = polylinePoints.decodePolyline(point);

if(result.isNotEmpty){
  result.forEach((PointLatLng pointLatLng) { 
    polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude)) ;
  }); 
}

Polyline polyline = Polyline(polylineId: PolylineId('youssef') , color: Color(0xff3498db) , width: 5 , points: polylineco) ;

polylineSet.add(polyline) ;

return polylineSet ;
}
