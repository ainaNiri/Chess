import 'package:chess/models/blank_case.dart';
import 'package:chess/models/chess_type.dart';
import 'package:chess/models/pion.dart';
import 'package:chess/models/roi.dart';
import 'package:chess/utilities/functions.dart';
import 'package:chess/utilities/variable.dart';
import 'package:chess/widgets/alias.dart';
import 'package:chess/widgets/animated_chess.dart';
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
        child: Stack(        
          children: [     
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(8, (i) => Row(
                children: List.generate(8, (j) => 
                (chessPiece[i][j].player == Player.p1 || chessPiece[i][j].player == Player.p2 || 
                  chessPiece[i][j].type == 2)?
                  GestureDetector(
                    onTap: (){
                      if(chessPiece[i][j].type != 3 && chessPiece[i][j].player == player){
                        onChessTapped(i, j, chessPiece);
                        oldCaseSelected[0] = i;
                        oldCaseSelected[1] = j;
                        setState(() {
                          
                        });
                      }
                      else if(chessPiece[i][j].type == 3 || chessPiece[i][j].type == 2){
                        chessPiece[i][j] = Blank(4);
                        newCaseSelected = [i, j];
                        isChess = false;
                        onChessTapped(i, j, chessPiece);
                        player == Player.p1 ? player = Player.p2 : player = Player.p1;
                        chessMate.clear();
                        piece.clear();
                        pieceChess.clear();
                        chessTemp = List.generate(chessPiece.length, (m) => List.generate(chessPiece.length, (n) => chessPiece[m][n].type));
                        Future.delayed(const Duration(milliseconds: 700), (){
                          for(int m = 0; m < chessPiece.length; m++){
                            for(int n = 0; n < chessPiece.length; n++){
                              if(player == Player.p1 ? chessPiece[m][n].player == Player.p2 : chessPiece[m][n].player == Player.p1
                                && chessPiece[m][n].runtimeType != Pion){
                                chessPiece[m][n].test(m, n, chessPiece);
                              }
                            }
                          }
                          // isForTest = true;
                          // for(int m = 0; m < chessPiece.length; m++){
                          //   for(int n = 0; n < chessPiece.length; n++){
                          //     if(player == Player.p1 ? chessPiece[m][n].player == Player.p1 : chessPiece[m][n].player == Player.p2
                          //       && chessPiece[m][n].runtimeType == Roi){
                          //       chessPiece[m][n].move(m, n, chessPiece);
                          //     }
                          //   }
                          // }
                          // if(isChessMate){
                          //   showDialog(
                          //     context: context, 
                          //     builder: (context){
                          //       return AlertDialog(
                          //         title: const Text("Victory"),
                          //         content: Text(player == Player.p1 ? "Player 2 win" : "Player 1 win"),
                          //       );
                          //     }
                          //   );
                          // }
                          // isForTest = false;
                          chessPiece[i][j].type = caseType[i][j];
                          setState(() {
                            
                          });
                        });
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
                            Alias(caseColor: caseType[i][j])
                          else
                            ChessCase(
                              caseType: chessPiece[i][j].type == 5 ? caseType[i][j] : chessPiece[i][j].type
                            ),
                          SizedBox(
                            width: 44,
                            height: 44,
                            child: (oldCaseSelected[0] == i && oldCaseSelected[1] == j && newCaseSelected[0] != -1) ? Container() : Center(
                              child: Text(chessPiece[i][j].piece , style: const TextStyle(fontSize: 26),),
                            ) 
                          )
                        ],
                      ),
                    ),
                  ) : 
                  ChessCase(
                    caseType: caseType[i][j],
                  ),
                ),
              ))
            ),
            if(newCaseSelected[0] != -1 && newCaseSelected[1] != -1)
            AnimatedChess(
              chessPiece: chessPiece[oldCaseSelected[0]][oldCaseSelected[1]],
              x: oldCaseSelected[1],
              y: oldCaseSelected[0],
            ),    
          ],
        )
      )
    );
  }
}