import 'package:chess/models/chess_type.dart';
import 'package:chess/models/roi.dart';
import 'package:chess/utilities/variable.dart';

class Pion extends ChessPiece{

  Pion(Player player, int type) : super(player : player, type : type, piece: player == Player.p1 ? "♙" : (player == Player.p2 ? "♟" : ""), hasMoved: false);

  @override
  void move(int x, int y, List<List<ChessPiece>> chess){
    if(isChess){
      for(int m = 0; m < piece.length; m++){
        if(piece[m][0] == x && piece[m][1] == y){
          return;
        }
      }
      if(chess[x][y].player == Player.p1){
        if(x + 1 < chess.length && y - 1 >= 0){
          if(x + 1 == chessMate[0][0] && y - 1 == chessMate[0][1]){
            chess[x + 1][y - 1].type = 2;
          }
        }
        if(x + 1 < chess.length && y + 1 < chess.length){
          if(x + 1 == chessMate[0][0] && y + 1 == chessMate[0][1]){       
            chess[x + 1][y + 1].type = 2;
          }
        }
        if(x + 1 < chess.length && hasMoved!){
          if(chessTemp[x + 1][y] == 1){       
            chess[x + 1][y].type = 1;
          }
        }
        else{
          if(chessTemp[x + 1][y] == 1){       
            chess[x + 1][y].type = 1;
          }
          if(chessTemp[x + 2][y] == 1){       
            chess[x + 2][y].type = 1;
          }
        }
      }
      else if(chess[x][y].player == Player.p2){
        if(x - 1 >= 0 && y + 1 < chess.length){
          if(x - 1 == chessMate[0][0] && y + 1 == chessMate[0][1]){
            chess[x - 1][y + 1].type = 2;
          }
        }
        if(x - 1 >= 0 && y - 1 >= 0){
          if(x - 1 == chessMate[0][0] && y - 1 == chessMate[0][1]){       
            chess[x - 1][y - 1].type = 2;
          }
        }
        if(x - 1 >= 0 && hasMoved!){
          if(chessTemp[x - 1][y] == 1){
            chess[x - 1][y].type = 1;
          }
        }
        else{
          if(chessTemp[x - 1][y] == 1){
            chess[x - 1][y].type = 1;
          }
          if(chessTemp[x - 2][y] == 1){
            chess[x - 2][y].type = 1;
          }
        }
      }
    }
    else{
      for(int m = 0; m < piece.length; m++){
        if(piece[m][0] == x && piece[m][1] == y){
          for(int n = 0; n < pieceChess.length; n++){
            if(chess[x][y].player == Player.p1){
              if(x + 1 < chess.length && y - 1 >= 0){
                if(x + 1 == pieceChess[m][0] && y - 1 == pieceChess[m][1]){
                  chess[x + 1][y - 1].type = 2;
                  return;
                }
              }
              if(x + 1 < chess.length && y + 1 < chess.length){
                if(x + 1 == pieceChess[m][0] && y + 1 == pieceChess[m][1]){       
                  chess[x + 1][y + 1].type = 2;
                  return;
                }
              }
            }
            else if(chess[x][y].player == Player.p2){
              if(x - 1 >= 0 && y + 1 < chess.length){
                if(x - 1 == pieceChess[m][0] && y + 1 == pieceChess[m][1]){
                  chess[x - 1][y + 1].type = 2;
                  return;
                }
              }
              if(x - 1 >= 0 && y - 1 >= 0){
                if(x - 1 == pieceChess[m][0] && y - 1 == pieceChess[m][1]){       
                  chess[x - 1][y - 1].type = 2;
                  return;
                }
              }
            }
          }
          return;
        }
      }
      if(chess[x][y].player == Player.p1){
        if(x + 1 < chess.length && y - 1 >= 0){
          if(chess[x + 1][y - 1].player == Player.p2){
            chess[x + 1][y - 1].type = 2;
          }
        }
        if(x + 1 < chess.length && y + 1 < chess.length){
          if(chess[x + 1][y + 1].player == Player.p2){       
            chess[x + 1][y + 1].type = 2;
          }
        }
        if(x + 1 < chess.length && hasMoved!){
          if(chess[x + 1][y].player == Player.none){
            chess[x + 1][y].type = 1;
          }
        }
        else{
          if(chess[x + 1][y].player == Player.none){
            chess[x + 1][y].type = 1;
          }
          if(chess[x + 2][y].player == Player.none){
            chess[x + 2][y].type = 1;
          }
        }
      }
      else{
        if(x - 1 >= 0 && y + 1 < chess.length){
          if(chess[x - 1][y + 1].player == Player.p1){
            chess[x - 1][y + 1].type = 2;
          }
        }
        if(x - 1 >= 0 && y - 1 >= 0){
          if(chess[x - 1][y - 1].player == Player.p1){
            chess[x - 1][y - 1].type = 2;
          }
        }
        if(x - 1 >= 0 && hasMoved!){
          if(chess[x - 1][y].player == Player.none){
            chess[x - 1][y].type = 1;
          }
        }
        else{
          if(chess[x - 1][y].player == Player.none){
            chess[x - 1][y].type = 1;
          }
          if(chess[x - 2][y].player == Player.none){
            chess[x - 2][y].type = 1;
          }
        }
      }
    }
  }

  @override
  void test(int x, int y,  List<List<ChessPiece>> chess){
    if(chess[x][y].player == Player.p1){
      if(x + 1 < chess.length && y - 1 >= 0){
        if(chess[x + 1][y - 1].runtimeType == Roi && chess[x +1][y - 1].player == Player.p2){
          chessMate.add([x, y]);
        }
      }
      else if(x + 1 < chess.length && y + 1 < chess.length){
        if(chess[x +1][y + 1].runtimeType == Roi && chess[x +1][y + 1].player == Player.p2){
          chessMate.add([x, y]);
        }
      }
    }

    else if(chess[x][y].player == Player.p2){
      if(x - 1 >= 0 && y - 1 >= 0){
        if(chess[x - 1][y - 1].runtimeType == Roi && chess[x - 1][y - 1].player == Player.p2){
          chessMate.add([x, y]);
        }
      }
      else if(x - 1 >= 0 && y + 1 < chess.length){
        if(chess[x - 1][y + 1].runtimeType == Roi && chess[x - 1][y + 1].player == Player.p2){
          chessMate.add([x, y]);
        }
      }
    }
  }
}