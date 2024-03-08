import 'package:flutter/material.dart';
import 'package:delivery/core/constant/color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text1;

  final String text2;

  final void Function()? onTap;

  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Text("Don't Have an Account ? "),
        Text(text1),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
                color: AppColor.primaryColr, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
