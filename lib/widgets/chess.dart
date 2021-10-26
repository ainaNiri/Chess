import 'package:chess/models/blank_case.dart';
import 'package:chess/models/chess_type.dart';
import 'package:chess/utilities/functions.dart';
import 'package:chess/utilities/variable.dart';
import 'package:chess/widgets/alias.dart';
import 'package:flutter/material.dart';
import 'package:chess/widgets/chess_case.dart';

class Chess extends StatefulWidget {
  const Chess({ Key? key }) : super(key: key);

  @override
  _ChessState createState() => _ChessState();
}

class _ChessState extends State<Chess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chess"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(8, (i) => Row(
            children: List.generate(8, (j) => 
            (chessPiece[i][j].player == Player.p1 || chessPiece[i][j].player == Player.p2 || 
              chessPiece[i][j].type == 2)?
              GestureDetector(
                onTap: (){
                  if((chessPiece[i][j].player == Player.p1 || chessPiece[i][j].player == Player.p2) &&
                    chessPiece[i][j].type != 3 && chessPiece[i][j].player == player){
                      onChessTapped(i, j, chessPiece);
                      oldCaseSelected[0] = i;
                      oldCaseSelected[1] = j;
                      setState(() {
                        
                      });
                    }
                  else if(chessPiece[i][j].type == 3 || chessPiece[i][j].type == 2){
                    chessPiece[i][j] = chessPiece[oldCaseSelected[0]][oldCaseSelected[1]];
                    chessPiece[oldCaseSelected[0]][oldCaseSelected[1]] = Blank(0);
                    oldCaseSelected[0] = -1;
                    oldCaseSelected[1] = -1;
                    onChessTapped(i, j, chessPiece);
                    player == Player.p1 ? player = Player.p2 : player = Player.p1;
                    setState(() {
                      
                    });
                  }
                },
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Stack(
                    children: [
                      if(chessPiece[i][j].type == 2)
                        Alias(caseType: caseType[i][j])
                      else
                        ChessCase(caseType: chessPiece[i][j].type),
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: Center(
                          child: Text(chessPiece[i][j].piece ?? " ", style: const TextStyle(fontSize: 26),),
                        ),
                      )
                    ],
                  ),
                ),
              ) : 
              ChessCase(
                caseType: chessPiece[i][j].type,
              ),
            ),
          ))
        )
      )
    );
  }
}