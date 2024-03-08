import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:delivery/view/screen/orders/archive.dart';
import 'package:delivery/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/view/screen/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted() ,
    const OrdersArchiveView() ,
    
  ];

  List buttonappbar = [
    {'title': 'Pending', 'icon': Icons.home},
    {'title': 'Accepted', 'icon': Icons.add_shopping_cart_outlined},
    {'title': 'Settings', 'icon': Icons.settings},
    
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentpage = i;
    update();
  }
}
