import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knk_pos_v1/Header_Navigation/Controllers/header_controller.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeaderGetX headerController = Get.put(HeaderGetX());
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 400),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0)
      ]),
      child: DefaultTabController(
        length: 4,
        child: Obx(() {
          var curIndex = headerController.index.value;
          return TabBar(
            indicator: BoxDecoration(
              color: Colors.blue,
              // boxShadow: const [
              //   BoxShadow(
              //       color: Colors.grey,
              //       offset: Offset(0, 0),
              //       blurRadius: 2,
              //       spreadRadius: 0)
              // ],
            ),
            tabs: [
              Center(
                child: Text(
                  'Purchase',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Center(
                child: Text('Register', style: TextStyle(color: Colors.black)),
              ),
              Center(
                child: Text('Report', style: TextStyle(color: Colors.black)),
              ),
              Center(
                child: Text('Account', style: TextStyle(color: Colors.black)),
              )
            ],
            onTap: (index) {
              headerController.changeIndex(index);
            },
          );
        }),
      ),
    );
  }
}
