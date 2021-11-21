import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:knk_pos_v1/Constants/temp_item.dart';
import 'package:knk_pos_v1/Purchase/Purchase_Table/Models/table_row_model.dart';

class EditRowWidget extends StatefulWidget {
  final int index;
  final RecordRow row;

  const EditRowWidget({
    Key? key,
    required this.index,
    required this.row,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<EditRowWidget> {
  late TextEditingController cateController;
  late TextEditingController dateController;
  late TextEditingController nameController;
  late TextEditingController vendorController;
  late TextEditingController qtyController;
  late TextEditingController unitpriceController;

  @override
  void initState() {
    super.initState();

    cateController = TextEditingController(text: widget.row.category);
    dateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(widget.row.date));
    nameController = TextEditingController(text: widget.row.name);
    vendorController = TextEditingController(text: widget.row.vendor);
    qtyController = TextEditingController(text: widget.row.quentity.toString());
    unitpriceController =
        TextEditingController(text: widget.row.unitPrice.toString());
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text("Edit Row" + widget.row.no.toString()),
        content: SizedBox(
          width: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Form(
                // key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: cateController,
                      decoration: InputDecoration(
                          hintText: widget.row.category,
                          label: Text(cateController.text)),
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                          hintText:
                              DateFormat('yyyy-MM-dd').format(widget.row.date),
                          label: Text(DateFormat('yyyy-MM-dd')
                              .format(DateTime.parse(dateController.text)))),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: widget.row.name,
                          label: Text(nameController.text)),
                    ),
                    TextFormField(
                      controller: vendorController,
                      decoration: InputDecoration(
                          hintText: widget.row.vendor,
                          label: Text(vendorController.text)),
                    ),
                    TextFormField(
                      controller: qtyController,
                      decoration: InputDecoration(
                          hintText: widget.row.quentity.toString(),
                          label: Text(qtyController.text)),
                    ),
                    TextFormField(
                      controller: unitpriceController,
                      decoration: InputDecoration(
                          hintText: widget.row.unitPrice.toString(),
                          label: Text(unitpriceController.text)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          child: const Text('Done'),
                          onPressed: () {
                            editUserData(widget.row);
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  editUserData(RecordRow rows) {
    
    // http.post(
    //   Uri.parse(UriLink.uri + '/userdata/edit'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'id': widget.user.id.toString(),
    //     'type_id': '2',
    //     'game_id': '1',
    //     'time_stamp': widget.user.timeStamp.toString() == dayController.text
    //         ? widget.user.timeStamp.toString()
    //         : dayController.text,
    //     'amount': widget.user.amount == amountController.text
    //         ? widget.user.amount
    //         : amountController.text,
    //     'luck_num': widget.user.luckNum == lNumController.text
    //         ? widget.user.luckNum
    //         : lNumController.text,
    //     'pouk_tee': widget.user.poukTee == pController.text
    //         ? widget.user.poukTee
    //         : pController.text
    //   }),
    // );
  }
}
