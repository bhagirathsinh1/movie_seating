// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_seating/method/build_chairs.dart';

class SeatingArrangment extends StatefulWidget {
  int rowvalue;
  int columnvalue;

  final ValueChanged<int> onAvailableSeatChanged;
  final ValueChanged<int> onSelectedSeatChanged;
  final ValueChanged<int> onReservedSeatChanged;
  int availableSeat;
  int selectedSeat;
  int reservedSeat;
  SeatingArrangment({
    Key? key,
    required this.size,
    required this.rowvalue,
    required this.columnvalue,
    required this.onAvailableSeatChanged,
    required this.onSelectedSeatChanged,
    required this.onReservedSeatChanged,
    required this.availableSeat,
    required this.selectedSeat,
    required this.reservedSeat,
  });

  final Size size;

  @override
  State<SeatingArrangment> createState() => _ChairListState();
}

class _ChairListState extends State<SeatingArrangment> {
  late List<List<int>> _chairStatus;
  @override
  void initState() {
    super.initState();
    _chairStatus = [
      for (var row = 0; row < widget.rowvalue; row += 1)
        [for (var column = 0; column < widget.columnvalue; column += 1) 1],
    ];
    // print('------------$matrix-----------------');
  }

  @override
  Widget build(BuildContext context) {
    print('-----------$_chairStatus-----------');
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (int row = 0; row < widget.rowvalue; row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int column = 0; column < widget.columnvalue; column++)
                      InkWell(
                        onLongPress: () {},
                        onTap: () {
                          if (_chairStatus[row][column] == 1) {
                            setState(() {
                              _chairStatus[row][column] = 2;
                              print('------$_chairStatus--------');
                              widget.onSelectedSeatChanged(
                                  widget.selectedSeat + 1);
                              widget.onAvailableSeatChanged(
                                  widget.availableSeat - 1);
                            });
                          } else if (_chairStatus[row][column] == 2) {
                            setState(() {
                              _chairStatus[row][column] = 3;
                              print('------$_chairStatus--------');
                              widget.onSelectedSeatChanged(
                                  widget.selectedSeat - 1);
                              widget.onReservedSeatChanged(
                                  widget.reservedSeat + 1);
                            });
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(new SnackBar(
                                  content: new Text('Seat Reserved')));
                          } else {
                            setState(
                              () {
                                _chairStatus[row][column] = 1;
                                print('------$_chairStatus--------');
                                widget.onAvailableSeatChanged(
                                    widget.availableSeat + 1);
                                widget.onReservedSeatChanged(
                                    widget.reservedSeat - 1);
                              },
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
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
            ],
          ),
        ),
      ),
    );
  }
}
