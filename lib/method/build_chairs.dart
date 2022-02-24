import 'package:flutter/material.dart';

class BuildChairs {
  static Widget selectedChair(int row, int column) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          'R-$row\nC-$column',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 10,
              color: Colors.purple),
        ),
      ),
    );
  }

  static Widget availableChair(int row, int column) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          'R-$row\nC-$column',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 10,
              color: Colors.purple),
        ),
      ),
    );
  }

  static Widget reservedChair(int row, int column) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          'R-$row\nC-$column',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 10,
              color: Colors.purple),
        ),
      ),
    );
  }
}
