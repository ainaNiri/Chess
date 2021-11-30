// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:chess/models/roi.dart';
import 'package:chess/utilities/variable.dart';

enum Player {p1, p2, none}

class ChessPiece{
  Player player;
  int type;
  String piece;
  bool? hasMoved;
  ChessPiece({required this.player, required this.type, required this.piece, this.hasMoved}) : super();

  void move(int x, int y, List<List<ChessPiece>> chess){
    
  }

  void test(int x, int y,  List<List<ChessPiece>> chess){
  
  }
}


void moveChess(int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
  int i = 1;
  if(isChess){
    for(int m = 0; m < piece.length; m++){
      if(piece[m][0] == x && piece[m][1] == y){
        return;
      }
    }
    while( i < 8){
      if(x + (dx*i) >=0 &&  y + (dy*i) >= 0 && x + (dx*i) < chess.length &&  y + (dy*i) < chess.length){
        if(chessTemp[x + (dx*i)][y + (dy*i)] == 1){
          chess[x + (dx*i)][y + (dy*i)].type = 1;
        }
        else if(x + (dx*i) == chessMate[0][0] && y + (dy*i) == chessMate[0][1]){
          chess[x + (dx*i)][y + (dy*i)].type = 2;
          return;
        }
        if(chess[x + (dx*i)][y + (dy*i)].player != Player.none){
          break;
        }
      }
      else{
        break;
      }
      i = i + 1;
    }
  }
  else{
    for(int m = 0; m < piece.length; m++){
      if(piece[m][0] == x && piece[m][1] == y){
        for(int n = 0; n < pieceChess.length; n++){
          while( i < 10){
            if(x + (dx*i) >=0 &&  y + (dy*i) >= 0 && x + (dx*i) < chess.length &&  y + (dy*i) < chess.length){
              if(chessTemp[x + (dx*i)][y + (dy*i)] == 1){
                chess[x + (dx*i)][y + (dy*i)].type = 1;
              }
              else if(x + (dx*i) == pieceChess[n][0] && y + (dy*i) == pieceChess[n][1]){
                chess[x + (dx*i)][y + (dy*i)].type = 2;
                return;
              }
              else{
                break;
              }
            }
            else{
              break;
            }
            i = i + 1;
          }
        }
        return;
      }
    }
    while( i < 8){
      if(x + (dx*i) >=0 &&  y + (dy*i) >= 0 && x + (dx*i) < chess.length &&  y + (dy*i) < chess.length){
        if(chess[x + (dx*i)][y + (dy*i)].player == Player.none){
          chess[x + (dx*i)][y + (dy*i)].type = 1;
        }
        else if(chess[x + (dx*i)][y + (dy*i)].player != chess[x][y].player){
          chess[x + (dx*i)][y + (dy*i)].type = 2;
          break;
        }
        else{
          break;
        }
      }
      else{
        break;
      }
      i = i + 1;
    }
  }
}

bool testChess(int scoop, int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
  int i = 1;
  int number = 0;
  List<List<int>> temp = List.generate(chess.length, (j) => List.generate(chess.length, (k) => chessTemp[j][k]));
  List<int> pos = [-1, -1];
  while( i < scoop){
    if(x + (dx*i) >= 0 &&  y + (dy*i) >= 0 && x + (dx*i) < chess.length &&  y + (dy*i) < chess.length){
      if(chess[x + (dx*i)][y + (dy*i)].player == Player.none){
        if(number < 1) chessTemp[x + (dx*i)][y + (dy*i)] = 1;
        i = i + 1;
        continue;
      }
      else if(chess[x + (dx*i)][y + (dy*i)].player != chess[x][y].player){
        if(chess[x + (dx*i)][y + (dy*i)].runtimeType == Roi){
          if(number == 1){
            pieceChess.add([x, y]);
            piece.add([pos[0], pos[1]]);
            return true;
          }
          else if(number == 0){
            chessMate.add([x, y]);
            isChess = true;
            return true;
          }
          break;
        }
        else{
          number = number + 1;
          pos[0] = x + (dx*i);
          pos[1] = y + (dy*i);
          i = i + 1;
        }
      }
      else{
        chessTemp = List.generate(chess.length, (j) => List.generate(chess.length, (k) => temp[j][k]));
        break;
      }
    }
    else{
      chessTemp = List.generate(chess.length, (j) => List.generate(chess.length, (k) => temp[j][k]));
      break;
    }
  }
  chessTemp = List.generate(chess.length, (j) => List.generate(chess.length, (k) => temp[j][k]));
  return false;
}