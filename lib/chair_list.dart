import 'package:flutter/material.dart';
import 'package:movie_seating/build_chairs.dart';

class ChairList extends StatelessWidget {
  ChairList({
    Key? key,
    required this.size,
    required this.rowvalue,
    required this.columnvalue,
  });
  int rowvalue;
  int columnvalue;

  final Size size;
  // final List _chairStatus = [
  //   [1, 1, 1, 1, 1, 1, 1],
  //   [1, 1, 1, 1, 3, 1, 1],
  //   [1, 1, 1, 1, 1, 3, 3],
  //   [2, 2, 2, 1, 3, 1, 1],
  //   [1, 1, 1, 1, 1, 1, 1],
  //   [1, 1, 1, 1, 3, 1, 1],
  // ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (int row = 0; row < rowvalue; row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int column = 0; column < columnvalue; column++)
                      Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.all(5.0),
                          child: BuildChairs.availableChair(row, column)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
