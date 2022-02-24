import 'package:flutter/material.dart';

class SeatCountingButton extends StatelessWidget {
  const SeatCountingButton({
    Key? key,
    required this.rowvalue,
    required this.columnvalue,
  }) : super(key: key);

  final int rowvalue;
  final int columnvalue;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      shape: CircleBorder(),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.blue]),
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
                      color: Colors.black.withOpacity(0.5), fontSize: 12),
                ),
                Text(
                  "Column - $columnvalue",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 12),
                ),
                Container(
                    height: 1, width: 80, color: Colors.black.withOpacity(0.5)),
                Text(
                  "Total - ${columnvalue * rowvalue}",
                  style: TextStyle(color: Colors.black.withOpacity(1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
