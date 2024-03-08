import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {"id": deliveryid});
    return response.fold((l) => 1, (r) => r);
  }

    doneDelivery( String usersid , String ordersid) async {
    var response = await crud.postData(AppLink.doneOrders, {"usersid": usersid , "ordersid": ordersid});
    return response.fold((l) => 1, (r) => r);
  }


}
