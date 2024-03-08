import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => 1, (r) => r);
  }


}
