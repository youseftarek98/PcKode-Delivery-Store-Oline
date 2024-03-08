import 'package:flutter/material.dart';
import 'package:delivery/core/constant/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;

  final void Function()? onPressed;

  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColr,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
