import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knk_pos_v1/Views/home.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Home(),
    );
  }
}
