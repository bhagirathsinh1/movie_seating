import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertDialogMethodClass {
  TextEditingController textGotoValueRow = TextEditingController();
  TextEditingController textGotoValueColumn = TextEditingController();

  final _formKeyRow = GlobalKey<FormState>();
  final _formKeyColumn = GlobalKey<FormState>();
  AlertDialogMethodClass(
      {Key? key,
      required this.onRowValueChanged,
      required this.onColumnValueChanged});

  ValueChanged<int> onRowValueChanged;
  ValueChanged<int> onColumnValueChanged;

  showGotoAlert(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("CANCEL"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        if (_formKeyRow.currentState!.validate() &&
            _formKeyColumn.currentState!.validate()) {
          int tempRow = int.parse(textGotoValueRow.text.toString());
          int tempcolumn = int.parse(textGotoValueColumn.text.toString());

          print('------------first temp--------$tempRow--------------');
          onRowValueChanged(tempRow);
          onColumnValueChanged(tempcolumn);

          Navigator.pop(context);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Enter Row & Column"),
      content: Container(
        height: 180,
        child: Column(
          children: [
            Form(
              key: _formKeyRow,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: textGotoValueRow,
                    validator: (value) {
                      if (value != null && value != "") {
                        int temp = int.parse(value.toString());
                        if (temp < 1) {
                          return "Row Can't be 0";
                        } else {
                          return null;
                        }
                      } else {
                        return "Enter Row";
                      }
                    },

                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(), labelText: 'Enter Row'),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Text(
                  //     'Enter Row',
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Form(
              key: _formKeyColumn,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: textGotoValueColumn,
                    validator: (value) {
                      if (value != null && value != "") {
                        int temp = int.parse(value.toString());
                        if (temp < 1) {
                          return "Column Can't be 0";
                        } else {
                          return null;
                        }
                      } else {
                        return "Enter Column";
                      }
                    },

                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Column'),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Text(
                  //     'Enter Row',
                  //     style: TextStyle(
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
