import 'package:flutter/material.dart';

class ChessCase extends StatefulWidget {
  int caseType;
  ChessCase({ Key? key , required this.caseType}) : super(key: key);

  @override
  _ChessCaseState createState() => _ChessCaseState();
}

class _ChessCaseState extends State<ChessCase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
        color: widget.caseType == 4 ? Colors.blue.shade300 : 
          (widget.caseType == 3 ? Colors.red : 
            (widget.caseType == 0 ? const Color.fromRGBO(0, 0, 0, 0.4) : Colors.orange[100])
          )
      ),
    );
  }
}