import 'package:get/get.dart';
import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/functions/handlinfdatacontroller.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/orders/pending_data.dart';
import 'package:delivery/data/model/ordersmodel.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrdersType(String val) {
    if (val == '0') {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == '0') {
      return "Cash On Delivery ";
    } else {
      return "Payment Card";
    }
  }

  String printOrdersStatus(String val) {
    if (val == '0') {
      return "Peding Approval ";
    } else if (val == '1') {
      return "The Order is being Prepared";
    } else if (val == '2') {
      return "Ready To Picked up by Delivery Man";
    } else if (val == '3') {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await ordersPendingData
        .getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata = response["data"];

        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

    approveOrders( String usersid , String ordersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await ordersPendingData
        .approveOrder(myServices.sharedPreferences.getString("id")!, 
          usersid ,  ordersid
        );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        getOrders() ;
           } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  

  refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
