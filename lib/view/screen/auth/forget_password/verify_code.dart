
import 'package:delivery/controller/forgetpassword/verifycode_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/auth/custom_text_body_auth.dart';
import 'package:delivery/view/widget/auth/custom_text_titel_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgoundcolor,
        elevation: 0.0,
        title: Text(
          '42'.tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColor.grey,
              ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
          child: ListView(
            children: [
              const CustomTextTitelAuth(text: 'Check Code'),
              const SizedBox(
                height: 10,
              ),
              const CustomTextBodyAuth(
                text:
                    'Please Enter The Digit Code Send To youssef.eng9898@gmail.com',
              ),
              const SizedBox(
                height: 15,
              ),
              OtpTextField(
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: AppColor.primaryColr,
                //Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetPassword(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(
                height: 6,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          )),
    );
  }
}
