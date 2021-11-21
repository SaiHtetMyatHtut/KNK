import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knk_pos_v1/Header_Navigation/Controllers/header_controller.dart';
import 'package:knk_pos_v1/Header_Navigation/header_bar.dart';
import 'package:knk_pos_v1/Views/purchase_views.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeaderGetX headerController = Get.put(HeaderGetX());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 120,
            color: Colors.white,
            child: const Center(
              child: HeaderBar(),
            ),
          ),
          Obx(() {
            var index = headerController.index.value;
            if (index == 0) {
              return const Expanded(child: PurchaseViews());
            } else if (index == 1) {
              return const Expanded(
                  child: Center(
                child: Text('Register is currently in development'),
              ));
            } else if (index == 2) {
              return const Expanded(
                  child: Center(
                child: Text('Report is currently in development'),
              ));
            } else if (index == 3) {
              return const Expanded(
                  child: Center(
                child: Text('Account is currently in development'),
              ));
            } else {
              return const Expanded(child: PurchaseViews());
            }
          })
        ],
      ),
    );
  }
}
