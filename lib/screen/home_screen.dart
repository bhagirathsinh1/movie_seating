import 'package:flutter/material.dart';
import 'package:movie_seating/method/alertDilog_method.dart';
import 'package:movie_seating/screen/theatre_screen.dart';
import 'package:movie_seating/widget/seat_counting_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var rowvalue = 5;
  var columnvalue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SeatCountingButton(rowvalue: rowvalue, columnvalue: columnvalue),
            Card(
              // elevation: 0,
              shape: CircleBorder(),
              child: Container(
                height: 80,
                width: 80,
                decoration: boxDecorationMethod(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          icon: new Icon(Icons.chair),
                          onPressed: () {
                            AlertDialogMethodClass(
                                onRowValueChanged: (int value) {
                              setState(() {
                                rowvalue = value;
                              });
                            }, onColumnValueChanged: (int value) {
                              setState(() {
                                columnvalue = value;
                              });
                            }).showGotoAlert(context);
                          }),
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
                decoration: boxDecorationMethod(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: new Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (rowvalue == 0 || columnvalue == 0) {
                            AlertDialogMethodClass(
                                onRowValueChanged: (int value) {
                              setState(() {
                                rowvalue = value;
                              });
                            }, onColumnValueChanged: (int value) {
                              setState(() {
                                columnvalue = value;
                              });
                            }).showGotoAlert(
                              context,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TheatreScreen(
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

  BoxDecoration boxDecorationMethod() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.blue]),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 0.1, offset: Offset(5, 5))
        ]);
  }
}
