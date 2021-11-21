import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knk_pos_v1/Purchase/Controllers/get_controller_purchase.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Action/purchase_action_button.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Table/purchase_table.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class PurchaseViews extends StatelessWidget {
  const PurchaseViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TableRowGetX tableController = Get.put(TableRowGetX());
    return Column(
      children: [
        const PurchaseActionButton(),
        Expanded(
            flex: 4,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                width: MediaQuery.of(context).size.width,
                child: const PurchaseTable())),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Cancel'))),
              const SizedBox(width: 20),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      final pdf = pw.Document();

                      pdf.addPage(
                        pw.Page(
                          build: (pw.Context context) => pw.Center(
                            child: pw.Text(tableController.rows.toString()),
                          ),
                        ),
                      );

                      final file = File('D:\\example.pdf');
                      await file.writeAsBytes(await pdf.save());
                    },
                    child: const Text('Save')),
              ),
            ],
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 100),
        //   padding: const EdgeInsets.symmetric(horizontal: 30),
        //   height: 30,
        //   child: Obx(() {
        //     var total = 0;
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Text('Total : '),
        //       ],
        //     );
        //   }),
        // ),
        SizedBox(height: 50),
      ],
    );
  }
}
