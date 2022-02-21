import 'package:flutter/material.dart';
import 'package:movie_seating/build_chairs.dart';

class ChairList extends StatelessWidget {
  ChairList({
    Key? key,
    required this.size,
  });

  final Size size;
  final List _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 3, 3],
    [2, 2, 2, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 3, 1, 1],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (int row = 0; row < 6; row++)
            Container(
              margin: EdgeInsets.only(top: row == 2 ? size.height * 0.02 : 0),
              child: Row(
                children: [
                  for (int column = 0; column <= 6; column++)
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(5.0),
                        child: _chairStatus[row][column] == 1
                            ? BuildChairs.availableChair(row, column)
                            : _chairStatus[row][column] == 2
                                ? BuildChairs.selectedChair(row, column)
                                : BuildChairs.reservedChair(row, column),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
