import 'package:flutter/material.dart';
import 'package:movie_seating/build_chairs.dart';

class ChairList extends StatefulWidget {
  int rowvalue;
  int columnvalue;
  ChairList({
    Key? key,
    required this.size,
    required this.rowvalue,
    required this.columnvalue,
  });

  final Size size;

  @override
  State<ChairList> createState() => _ChairListState();
}

class _ChairListState extends State<ChairList> {
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

  var maxrow = 10;

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
                        onTap: () {
                          if (_chairStatus[row][column] == 1) {
                            setState(() {
                              _chairStatus[row][column] = 2;
                              print('------$_chairStatus--------');
                            });
                          } else if (_chairStatus[row][column] == 2) {
                            setState(() {
                              _chairStatus[row][column] = 3;
                              print('------$_chairStatus--------');
                            });
                            Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text('Seat Reserved')));
                          } else {
                            setState(
                              () {
                                _chairStatus[row][column] = 1;
                                print('------$_chairStatus--------');
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
