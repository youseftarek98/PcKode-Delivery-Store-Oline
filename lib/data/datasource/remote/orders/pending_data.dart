import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => 1, (r) => r);
  }

  approveOrder(String deliveryid , String usersid , String ordersid) async {
    var response = await crud.postData(AppLink.approveOrders,
     {"deliveryid" : deliveryid , "usersid" : usersid , "ordersid" : ordersid});
    return response.fold((l) => 1, (r) => r);
  }

}
