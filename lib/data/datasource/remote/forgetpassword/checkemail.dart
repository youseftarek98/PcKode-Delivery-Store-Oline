import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
