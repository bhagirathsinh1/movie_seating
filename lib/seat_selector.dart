import 'package:flutter/material.dart';
import 'package:movie_seating/chair_list.dart';
import 'package:movie_seating/seat_info.dart';

class SeatSelector extends StatefulWidget {
  const SeatSelector({Key? key}) : super(key: key);

  @override
  _SeatSelectorState createState() => _SeatSelectorState();
}

class _SeatSelectorState extends State<SeatSelector> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black,
            width: size.width,
          ),
          Positioned(
            top: 48,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.70,
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
                  width: MediaQuery.of(context).size.width * 0.60,
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
            bottom: size.height * 0.2,
            child: Container(
              width: size.width * 0.70,
              child: Column(
                children: [
                  ChairList(size: size),
                  SeatInfo(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
