import 'package:get/get.dart';

class HeaderGetX extends GetxController {
  RxInt index = 0.obs;
  void changeIndex(int? value) {
    index.value = value!;
  }
}
