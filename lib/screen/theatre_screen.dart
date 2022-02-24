import 'package:flutter/material.dart';
import 'package:movie_seating/seating_arrangment.dart';
import 'package:movie_seating/seat_info.dart';
import 'package:movie_seating/widget/theatre_light_widget.dart';

class TheatreScreen extends StatefulWidget {
  TheatreScreen({Key? key, required this.rowvalue, required this.columnvalue})
      : super(key: key);
  final int rowvalue;
  final int columnvalue;

  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<TheatreScreen> {
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
            ),
            Positioned(
              top: 10,
              child: SeatInfo(
                  availableSeat: availableSeat,
                  selectedSeat: selectedSeat,
                  reservedSeat: reservedSeat),
            ),
            Positioned(
              top: 55,
              child: TheatreLightWidget(),
            ),
            Positioned(
              top: size.height / 6,
              child: Container(
                height: size.height / 1.5,
                width: size.width * 0.90,
                child: Column(
                  children: [
                    SeatingArrangment(
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
