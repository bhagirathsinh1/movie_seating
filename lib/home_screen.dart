import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_seating/seat_selector.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textGotoValueRow = TextEditingController();
  TextEditingController textGotoValueColumn = TextEditingController();

  final _formKeyRow = GlobalKey<FormState>();
  final _formKeyColumn = GlobalKey<FormState>();

  var rowvalue;
  var columnvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              // elevation: 0,
              shape: CircleBorder(),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.blue]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.1,
                        offset: Offset(5, 5),
                      ),
                    ]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Row - $rowvalue",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12),
                        ),
                        Text(
                          "Column - $columnvalue",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12),
                        ),
                        Container(
                            height: 1,
                            width: 80,
                            color: Colors.black.withOpacity(0.5)),
                        Text(
                          "Total - ${columnvalue * rowvalue}",
                          style: TextStyle(color: Colors.black.withOpacity(1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              // elevation: 0,
              shape: CircleBorder(),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.blue]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.1,
                        offset: Offset(5, 5),
                      ),
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: new Icon(Icons.chair),
                        onPressed: () {
                          showGotoAlert(context);
                        },
                      ),
                      Text(
                        "Edit Seat",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              // elevation: 0,
              shape: CircleBorder(),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.blue]),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.1,
                        offset: Offset(5, 5),
                      ),
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: new Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (rowvalue == 0 ||
                              rowvalue == null ||
                              columnvalue == 0 ||
                              columnvalue == null) {
                            showGotoAlert(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeatSelector(
                                      rowvalue: rowvalue,
                                      columnvalue: columnvalue)),
                            );
                          }
                        },
                      ),
                      Text(
                        "Enter",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          setState(() {
            rowvalue = tempRow;
            columnvalue = tempcolumn;
          });
          Navigator.pop(context); // Navigator.pop(context);
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
