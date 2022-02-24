import 'package:flutter/material.dart';

class SeatInfo extends StatelessWidget {
  const SeatInfo({
    Key? key,
    required this.availableSeat,
    required this.selectedSeat,
    required this.reservedSeat,
  }) : super(key: key);
  final int availableSeat;
  final int selectedSeat;
  final int reservedSeat;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              Text(
                'Available : $availableSeat',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[400],
                ),
              ),
              Text(
                'Selected : $selectedSeat',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: Colors.green[400],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
              Text(
                'Reserved : $reservedSeat',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
