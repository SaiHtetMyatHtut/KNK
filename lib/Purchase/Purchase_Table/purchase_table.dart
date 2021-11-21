import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:knk_pos_v1/Constants/temp_item.dart';
import 'package:knk_pos_v1/Purchase/Controllers/get_controller_purchase.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Table/Models/table_row_model.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Table/purchase_record_edit.dart';

class PurchaseTable extends StatelessWidget {
  const PurchaseTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TableRowGetX tableController = Get.put(TableRowGetX());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
      child: SingleChildScrollView(
        child: Obx(() {
          return DataTable(
            columns: getColumns(title),
            rows: getRows(context, tableController.rows),
          );
        }),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(column,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.orange)));
    }).toList();
  }

  List<DataRow> getRows(context, List<RecordRow> record) {
    TableRowGetX tableController = Get.put(TableRowGetX());
    return record.map((RecordRow record) {
      final cells = [
        record.no,
        record.category,
        DateFormat('yyyy-MM-dd').format(record.date),
        record.name,
        record.net,
        record.vendor,
        record.quentity,
        record.unitPrice,
        record.totalPrice,
        'Edit',
        'Delete'
      ];
      return DataRow(
          cells: modelBuilder(cells, (index, cell) {
        if (index == 9) {
          return DataCell(Text('Edit'), onTap: () {
            showUserEditDialog(context, index: index, row: record);
          });
        }
        if (index == 10) {
          return DataCell(Text('Delete'), onTap: () {
            tableController.removeRow(record);
          });
        } else {
          return DataCell(Text('$cell'));
        }
      }));
    }).toList();
  }

  Future<T?> showUserEditDialog<T>(
    BuildContext context, {
    required int index,
    required RecordRow row,
  }) =>
      showDialog<T>(
        context: context,
        builder: (context) => EditRowWidget(
          index: index,
          row: row,
        ),
      );

  List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
