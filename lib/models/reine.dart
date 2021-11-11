// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:chess/models/chess_type.dart';

class Reine extends ChessPiece{
  Reine(Player player, int type) : super(player : player, type : type, piece: player == Player.p1 ? "♕" : (player == Player.p2 ? "♛" : ""));

  @override
  void move(int x, int y, List<List<ChessPiece>> chess){
    moveChess(x, y, 1, 0, chess);
    moveChess(x, y, -1, 0, chess);
    moveChess(x, y, 0, 1, chess);
    moveChess(x, y, 0, -1, chess);
    moveChess(x, y, 1, 1, chess);
    moveChess(x, y, 1, -1, chess);
    moveChess(x, y, -1, 1, chess);
    moveChess(x, y, -1, -1, chess);
  }

  @override
  void test(int x, int y, List<List<ChessPiece>> chess){
    if (testChess(10, x, y, 1, 0, chess)) return;
    else if(testChess(10, x, y, -1, 0, chess)) return ;
    else if (testChess(10, x, y, 0, 1, chess)) return ;
    else if (testChess(10, x, y, 0, -1, chess)) return;
    else if (testChess(10 , x, y, 1, 1, chess)) return;
    else if (testChess(10 , x, y, 1, -1, chess)) return;
    else if (testChess(10 , x, y, -1, 1, chess)) return;
    else if (testChess(10 , x, y, -1, -1, chess)) return;
  }
}