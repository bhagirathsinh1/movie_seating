import 'package:flutter/material.dart';

class SeatInfo extends StatelessWidget {
  const SeatInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              'Available',
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
                color: Colors.grey,
              ),
            ),
            Text(
              'Reserved',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.grey,
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
              'Selected',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Colors.green[400],
              ),
            )
          ],
        ),
      ],
    );
  }
}
