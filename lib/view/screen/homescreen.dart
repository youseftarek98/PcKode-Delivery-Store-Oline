

import 'package:delivery/core/functions/alertexitapp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/view/widget/home/custombuttonappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text('Orders'),),
              bottomNavigationBar: const CustomButtonAppBarHome(),
              body: WillPopScope(
                  onWillPop: alertExitApp,
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
