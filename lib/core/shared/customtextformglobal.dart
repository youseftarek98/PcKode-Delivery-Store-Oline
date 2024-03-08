import 'package:flutter/material.dart';

class CustomTextFormGlobal extends StatelessWidget {
  final String hinttext;

  final String labeltext;

  final IconData iconData;

  final TextEditingController? mycontroller;

  final String? Function(String?) valid;

  final bool isNumber;

  final bool? obscureText;

  final void Function()? onTapIcon;

  const CustomTextFormGlobal(
      {Key? key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labeltext),
            ),
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(iconData),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
