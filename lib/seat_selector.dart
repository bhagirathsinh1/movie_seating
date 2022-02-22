import 'package:flutter/material.dart';
import 'package:movie_seating/chair_list.dart';
import 'package:movie_seating/seat_info.dart';

class SeatSelector extends StatefulWidget {
  SeatSelector({Key? key, required this.rowvalue, required this.columnvalue})
      : super(key: key);
  final int rowvalue;
  final int columnvalue;

  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total Seat - ${widget.rowvalue * widget.columnvalue}',
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
              width: size.width,
            ),
            Positioned(
              top: 55,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.transparent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 1]),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 4.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height / 6,
              child: Container(
                height: size.height / 1.5,
                width: size.width * 0.90,
                child: Column(
                  children: [
                    ChairList(
                        size: size,
                        rowvalue: widget.rowvalue,
                        columnvalue: widget.columnvalue),
                    SizedBox(height: 10),
                    SeatInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
