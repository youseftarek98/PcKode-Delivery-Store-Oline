import 'dart:async';
import 'package:delivery/controller/orders/accepted_controller.dart';
import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/getdecodepolyline.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackingController extends GetxController{
StreamSubscription<Position>? positionStream ;

Set<Polyline> polylineSet = {} ;

  GoogleMapController? gmc;

  MyServices myServices = Get.find();

  CameraPosition? cameraPosition;

  List<Marker> markers = [];

  Timer ? timer ;

  StatusRequest statusRequest = StatusRequest.success;

  late OrdersModel ordersModel;

  OrdersAcceptedController ordersAcceptedController = Get.find() ;

  double? destlat;
  double? destlong;

 double? currentlat;
 double? currentlong ;



 doneDelivery () async {
 statusRequest = StatusRequest.loading ;
 // update() ;
 await ordersAcceptedController.approveOrders(ordersModel.ordersId!, ordersModel.ordersUsersid!) ;
  Get.offAllNamed(AppRoute.homePage) ;
 
 }

getCurrentLocation(){
   cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );

     markers.add(Marker(
          markerId:  const MarkerId('dest'),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));

 positionStream = Geolocator.getPositionStream().listen(
    (Position? position) {
      currentlat = position!.latitude ;
      currentlong = position.longitude ;
      print("=============== Currnt Postion") ;
      print(position.latitude) ;
      print(position.longitude) ;

      if(gmc != null){
        gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!))) ;
      }

      markers.removeWhere((element) => element.markerId.value == 'current') ;
     markers.add(Marker(
          markerId:  const MarkerId('current'),
          position: LatLng(position.altitude,position.longitude)));
          update() ;
    });

}



refreshLocation()async{
  Future.delayed(const Duration(seconds: 2)) ;
  timer = Timer.periodic(const Duration(seconds: 10), (timer) { 
      FirebaseFirestore.instance.collection('delivery').doc(ordersModel.ordersId).set({
    "lat" : currentlat,
    "long" :currentlong ,
    "deliveryid" : myServices.sharedPreferences.getString('id')
  });
  }) ;

}

initPolyLine()async{
  destlat = double.parse(ordersModel.addressLat!) ;
  destlong = double.parse(ordersModel.addressLong!) ;
  Future.delayed(const Duration(seconds: 1)) ;
  polylineSet = await getPolyline(currentlat , currentlong , destlat , destlong) ;
  update() ;
}

@override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
   getCurrentLocation() ;
   refreshLocation() ;
   initPolyLine() ;
    super.onInit();
  }

  @override
  void dispose() {
    positionStream!.cancel();
    gmc!.dispose();
    timer!.cancel() ;
    super.dispose();
  }

}