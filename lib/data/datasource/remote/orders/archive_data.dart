import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viewarchiveOrders, {"id": deliveryid});
    return response.fold((l) => 1, (r) => r);
  }


}
