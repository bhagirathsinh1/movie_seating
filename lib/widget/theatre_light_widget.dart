import 'package:flutter/material.dart';

class TheatreLightWidget extends StatelessWidget {
  const TheatreLightWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.90,
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
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 4.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
