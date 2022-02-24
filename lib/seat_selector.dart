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
  void initState() {
    super.initState();
    // setState(() {
    availableSeat = widget.rowvalue * widget.columnvalue;
    // });
  }

  int availableSeat = 0;
  int selectedSeat = 0;
  int reservedSeat = 0;
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
              alignment: Alignment.topLeft,
              color: Colors.black,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available : $availableSeat',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    Text(
                      'Selected  : $selectedSeat',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    Text(
                      'Reserved : $reservedSeat',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
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
                  ),
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
                        availableSeat: availableSeat,
                        reservedSeat: reservedSeat,
                        selectedSeat: selectedSeat,
                        onAvailableSeatChanged: ((value) => setState(() {
                              availableSeat = value;
                            })),
                        onReservedSeatChanged: ((value) => setState(() {
                              reservedSeat = value;
                            })),
                        onSelectedSeatChanged: ((value) => setState(() {
                              selectedSeat = value;
                            })),
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
