import 'package:chess/models/chess_type.dart';

class Pion extends ChessPiece{

  Pion(Player player, int type) : super(player : player, type : type, piece: player == Player.p1 ? "♙" : (player == Player.p2 ? "♟" : ""));
  bool isMoved = false;

  @override
  void move(int x, int y, List<List<ChessPiece>> chess){
    if(chess[x][y].player == Player.p1){
      if(x + 1 < chess.length && y - 1 >= 0){
        if(chess[x + 1][y - 1].player == Player.p2){
          chess[x + 1][y - 1].type = 3;
        }
      }
      if(x + 1 < chess.length && y + 1 < chess.length){
        if(chess[x + 1][y + 1].player == Player.p2){
          chess[x + 1][y + 1].type = 3;
        }
      }
      if(x + 1 < chess.length && isMoved){
        if(chess[x + 1][y].player == Player.none){
          chess[x + 1][y].type = 2;
        }
      }
      else{
        if(chess[x + 2][y].player == Player.none){
          chess[x + 1][y].type = 2;
          chess[x + 2][y].type = 2;
        }
      }
    }
    else{
      if(x - 1 >= 0 && y + 1 < chess.length){
        if(chess[x - 1][y + 1].player == Player.p1){
          chess[x - 1][y + 1].type = 3;
        }
      }
      if(x - 1 >= 0 && y - 1 >= 0){
        if(chess[x - 1][y - 1].player == Player.p1){
          chess[x - 1][y - 1].type = 3;
        }
      }
      if(x - 1 >= 0 && isMoved){
        if(chess[x - 1][y].player == Player.none){
          chess[x - 1][y].type = 2;
        }
      }
      else{
        if(chess[x - 2][y].player == Player.none){
          chess[x - 1][y].type = 2;
          chess[x - 2][y].type = 2;
        }
      }
    }
  }
}