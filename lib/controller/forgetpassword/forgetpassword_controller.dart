import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/functions/handlinfdatacontroller.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController{
  checkemail();
}
class ForgetPasswordControllerImp extends ForgetPasswordController{

   CheckEmailData checkEmailData = CheckEmailData(Get.find()) ;

   GlobalKey<FormState> formstate = GlobalKey<FormState>() ;
   
   late TextEditingController email ;

StatusRequest statusRequest = StatusRequest.none;


  @override
  checkemail() async{
    if(formstate.currentState!.validate()){
      print("================== Response Controller  ================") ;
        statusRequest = StatusRequest.loading ;
     update() ;
    var response = await checkEmailData.postData( email.text );
    //print("================== Response Controller $response") ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success == statusRequest){
      print("================== Response Controller $response ================") ;
       if(response["status"] == "success"){
        //print("================== Response Controller $response") ;
      //  data.addAll(response["data"]) ;
        Get.offNamed(AppRoute.verfiyCode , arguments: {
          "email" : email.text
        }) ;
       }else{
        Get.defaultDialog(title: 'Warning' , middleText: "Email Not Found") ;
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
    }
  }


@override
  void onInit() {
    email = TextEditingController();  
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose() ;
  
    super.dispose();
  }

}