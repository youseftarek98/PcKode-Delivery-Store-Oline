import 'package:get/get.dart';
import 'package:delivery/core/class/crud.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}