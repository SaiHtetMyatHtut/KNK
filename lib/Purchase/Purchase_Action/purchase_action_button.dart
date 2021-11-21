import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knk_pos_v1/Constants/temp_item.dart';
import 'package:knk_pos_v1/Purchase/Controllers/get_controller_purchase.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Table/Models/table_row_model.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PurchaseActionButton extends StatelessWidget {
  const PurchaseActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    // Normal Controller
    DateRangePickerController _c = DateRangePickerController();
    TextEditingController _tc = TextEditingController();

    // Getx Controller
    CategoryGetX cateController = Get.put(CategoryGetX());
    POSDatePickerGetX posDateController = Get.put(POSDatePickerGetX());
    ItemNameGetX nameController = Get.put(ItemNameGetX());
    NetGetX netController = Get.put(NetGetX());
    VendorGetX vendorController = Get.put(VendorGetX());
    QuantityGetX quantityController = Get.put(QuantityGetX());
    UnitPriceGetX unitPriceController = Get.put(UnitPriceGetX());
    TableRowGetX tableController = Get.put(TableRowGetX());
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(1, 2),
                blurRadius: 3,
                spreadRadius: 0)
          ]),
      child: Obx(() {
        return Row(
          children: [
            const SizedBox(width: 50),
            Expanded(
              child: DropdownButton<String>(
                value: cateController.category.value,
                elevation: 8,
                underline: const SizedBox(),
                items:
                    cateListItem.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(value),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  // context.read(categoryProvider.notifier).changeCategory(value);
                  cateController.changeCategory(value);
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: Container(
                                width: 300,
                                height: 400,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    SfDateRangePicker(
                                      selectionMode:
                                          DateRangePickerSelectionMode.single,
                                      controller: _c,
                                    ),
                                    Align(
                                      child: MaterialButton(
                                        onPressed: () {
                                          posDateController
                                              .changeDate(_c.selectedDate);
                                          Get.back();
                                        },
                                        color: Colors.blueAccent,
                                        child: const Center(
                                          child: Text(
                                            'Okay',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.date_range_rounded)),
                  Text(posDateController.date.value),
                ],
              ),
            ),
            Expanded(
              child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  controller: _tc,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    // labelText: nameController.name.value,
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Item Name',
                  ),
                  onTap: () {
                    _tc.text = '';
                  },
                ),
                // onSaved: (value) {
                //   _c.text = value!;
                // },
                suggestionsCallback: (pattern) {
                  return suggestions
                      .where((element) => element.contains(pattern));
                },
                keepSuggestionsOnLoading: false,
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion.toString()),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  nameController.changeName(suggestion.toString());
                  _tc.text = suggestion.toString();
                },
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: Center(
                  child: Text(netController.net.value),
                ),
              ),
            ),
            Expanded(
              child: DropdownButton<String>(
                value: vendorController.vendor.value,
                elevation: 8,
                underline: const SizedBox(),
                items: vendorListitem
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(value),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  // context.read(vendorProvider.notifier).changeVendor(value);
                  vendorController.changeVendor(value);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), hintText: '0'),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    // context
                    //     .read(quantityProvider.notifier)
                    //     .changeQuantity(int.parse(value));
                    quantityController.changeQty(int.parse(value));
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), hintText: '1000'),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    // context
                    //     .read(unitPriceProvider.notifier)
                    //     .changeUnitPrice(int.parse(value));
                    unitPriceController.changeAmount(int.parse(value));
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: Center(
                  child: Text((quantityController.qty.value *
                          unitPriceController.amount.value)
                      .toString()),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    final record = RecordRow(
                      no: counter,
                      category: cateController.category.value,
                      date: DateTime.parse(posDateController.date.value),
                      name: nameController.name.value,
                      net: netController.net.value,
                      vendor: vendorController.vendor.value,
                      quentity: quantityController.qty.value,
                      unitPrice: unitPriceController.amount.value,
                      totalPrice: quantityController.qty.value *
                          unitPriceController.amount.value,
                    );
                    if (nameController.name.value.isEmpty ||
                        unitPriceController.amount.value.isEqual(0) ||
                        quantityController.qty.value.isEqual(0)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Dont Leave Values Empty!')));
                    } else {
                      tableController.addRow(record);
                      counter++;
                    }
                  },
                  child: const Center(
                    child: Text('Add'),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
