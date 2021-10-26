// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Alias extends StatelessWidget {
  int caseType;
  Alias({ Key? key , required this.caseType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 44,
          height: 44,
          color: caseType == 0 ? const Color.fromRGBO(0, 0, 0, 0.4) : Colors.orange[100],
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