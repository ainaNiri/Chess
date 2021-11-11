import 'package:chess/models/blank_case.dart';
import 'package:chess/models/chess_type.dart';
import 'package:chess/models/pion.dart';
import 'package:chess/utilities/variable.dart';
import 'package:flutter/material.dart';

class AnimatedChess extends StatefulWidget {
  int x;
  int y;
  ChessPiece chessPiece;
  AnimatedChess({ Key? key , required this.x, required this.y, required this.chessPiece}) : super(key: key);

  @override
  _AnimatedChessState createState() => _AnimatedChessState();
}

class _AnimatedChessState extends State<AnimatedChess> {

  bool _animate = false;
  bool ok = true;

  @override
  Widget build(BuildContext context) {

    if(ok){
      Future.delayed(const Duration(milliseconds: 100), (){
        _animate = true;
        if(chessPiece[widget.y][widget.x].runtimeType == Pion){
          chessPiece[widget.y][widget.x].hasMoved = true;
        }
        chessPiece[newCaseSelected[0]][newCaseSelected[1]] = chessPiece[oldCaseSelected[0]][oldCaseSelected[1]];
        chessPiece[oldCaseSelected[0]][oldCaseSelected[1]] = Blank(widget.chessPiece.type);
        oldCaseSelected = [-1, -1];
        ok = false;
        Future.delayed(const Duration(milliseconds: 300), (){
          newCaseSelected = [-1, -1];
        });
        setState(() {
          _animate = true;
        });
      });
    }

    return Stack(
      children: [
        AnimatedPositioned(
          curve: Curves.fastOutSlowIn,
          left: _animate ? 12.5 + newCaseSelected[1].toDouble() * 44 :  12.5 + widget.x * 44,
          top: _animate ? 187.5 + newCaseSelected[0].toDouble() * 44 : 187.5 + widget.y * 44,
          duration: const Duration(milliseconds: 450),
          child: Text(widget.chessPiece.piece , style: const TextStyle(fontSize: 26),),
        ),
      ],
    );
  }
}