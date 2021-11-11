// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ChessCase extends StatelessWidget {
  int caseType;
  ChessCase({ Key? key , required this.caseType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
        color: caseType == 4 ? Colors.green[300] : 
          (caseType == 3 ? Colors.red : 
            (caseType == 0 ? Colors.brown[300] : Colors.orange[100])
          )
      ),
    );
  }
}