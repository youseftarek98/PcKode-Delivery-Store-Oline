import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/home_controller.dart';
import 'package:delivery/core/class/handlingdataview.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/data/model/itemsmodel.dart';
import 'package:delivery/linkapi.dart';
import 'package:delivery/view/widget/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
             Center(
               child: Container(
                child: Text('hhhhhhhhhhhhh'),
               ),
             )
            ],
          )),
    );
  }
}

