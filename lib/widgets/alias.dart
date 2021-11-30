// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Alias extends StatelessWidget {
  int caseColor;
  Alias({ Key? key , required this.caseColor}) : super(key: key);

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
          child: Center(child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )
      ],
    );
  }
}