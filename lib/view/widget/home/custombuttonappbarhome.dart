import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/view/widget/home/custombuttonappbar.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(
                  controller.listPage.length ,
                  (index) {
                    return Expanded(
                      child: CustomButtonAppBar(
                              textButton: controller.buttonappbar[index]['title'],
                              iconData: controller.buttonappbar[index]['icon'],
                              onPressed: () {
                                controller.changePage(index);
                              },
                              active: controller.currentpage == index ? true : false,
                            ),
                    );
                  },
                )
              ],
            )));
  }
}
