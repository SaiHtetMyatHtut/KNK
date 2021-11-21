import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knk_pos_v1/Constants/temp_item.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Table/Models/table_row_model.dart';

class CategoryGetX extends GetxController {
  RxString category = cateListItem[0].obs;
  void changeCategory(String? value) {
    category.value = value!;
  }
}

class POSDatePickerGetX extends GetxController {
  RxString date = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  void changeDate(DateTime? value) {
    date.value = DateFormat('yyyy-MM-dd').format(value!);
  }
}

class ItemNameGetX extends GetxController {
  RxString name = suggestions[0].obs;
  void changeName(String? value) {
    name.value = value!;
  }
}

class NetGetX extends GetxController {
  RxString net = '1 Litter'.obs;
  void changeNet(String? value) {
    net.value = value!;
  }
}

class VendorGetX extends GetxController {
  RxString vendor = vendorListitem[0].obs;
  void changeVendor(String? value) {
    vendor.value = value!;
  }
}

class QuantityGetX extends GetxController {
  RxInt qty = 1.obs;
  void changeQty(int? value) {
    qty.value = value!;
  }
}

class UnitPriceGetX extends GetxController {
  RxInt amount = 0.obs;
  void changeAmount(int? value) {
    amount.value = value!;
  }
}

class TableRowGetX extends GetxController {
  RxList<RecordRow> rows = <RecordRow>[].obs;
  void addRow(RecordRow? row) {
    rows.add(row!);
  }

  void removeRow(RecordRow? value) {
    rows.remove(value!);
  }
}
