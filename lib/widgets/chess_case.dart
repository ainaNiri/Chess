// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ChessCase extends StatelessWidget {
  int caseColor;
  int caseType;
  ChessCase({ Key? key , required this.caseColor, required this.caseType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 44,
          height: 44,
          color: caseColor%2 == 0 ? Colors.brown[300] : Colors.orange[100],
        ),
        SizedBox(
          width: 44,
          height: 44,
          child: Container(
            width: 10,
            height: 10,
            color: caseType == 0 ? Colors.transparent : caseType == 3 ? Colors.blue[300] : (caseType == 1 ? Colors.green[300] : Colors.red),
          )
        )
      ],
    );
  }
}