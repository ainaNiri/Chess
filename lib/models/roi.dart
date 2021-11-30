import 'package:chess/models/blank_case.dart';
import 'package:chess/models/chess_type.dart';
import 'package:chess/utilities/variable.dart';

class Roi extends ChessPiece{
  Roi(Player player, int type) : super(player : player, type : type, piece: player == Player.p1 ? "♔" : (player == Player.p2 ? "♚" : ""));

  @override
  void move(int x, int y, List<List<ChessPiece>> chess){
    moveRoi(x, y, 1, 0, chess);
    moveRoi(x, y, -1, 0, chess);
    moveRoi(x, y, 0, 1, chess);
    moveRoi(x, y, 0, -1, chess);
    moveRoi(x, y, 1, 1, chess);
    moveRoi(x, y, 1, -1, chess);
    moveRoi(x, y, -1, 1, chess);
    moveRoi(x, y, -1, -1, chess);
  }
  
  void moveRoi(int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
    if(x + (dx) >=0 &&  y + (dy) >= 0 && x + (dx) < chess.length &&  y + (dy) < chess.length){
      bool isChessTemp = isChess;
      ChessPiece temp = chess[x][y];
      ChessPiece temp1 = chess[x + (dx)][y + (dy)];
      if(chess[x + (dx)][y + (dy)].player == Player.none){
        chess[x][y] = Blank(0);
        chess[x + (dx)][y + (dy)] = temp;
        for(int m = 0; m < chess.length; m++){
          for(int n = 0; n < chess.length; n++){
            if(player == Player.p1 ? chessPiece[m][n].player == Player.p2 : 
              chessPiece[m][n].player == Player.p1){
              isChess = false;
              chess[m][n].test(m, n, chess);
              if(isChess){
                chess[x + (dx)][y + (dy)] = temp1;
                chess[x][y] = temp;
                isChess = isChessTemp;
                return;
              }
            }
          }
        }
        if(isForTest){
          isChessMate = false;
          chess[x + (dx)][y + (dy)] = temp1;
          chess[x][y] = temp;
          isChess = isChessTemp;
        }
        else{
          chess[x + (dx)][y + (dy)] = Blank(1);
          chess[x][y] = temp;
          isChess = isChessTemp;
        }
      }
      else if(chess[x + (dx)][y + (dy)].player != chess[x][y].player){
        chess[x + (dx)][y + (dy)] = chess[x][y];
        chess[x][y] = Blank(chess[x][y].type);
        for(int m = 0; m < chess.length; m++){
          for(int n = 0; n < chess.length; n++){
            if(player == Player.p1 ? chessPiece[m][n].player == Player.p2 : 
              chessPiece[m][n].player == Player.p1){
              isChess = false;
              chess[m][n].test(m, n, chess);
              if(isChess){
                chess[x + (dx)][y + (dy)] = temp1;
                chess[x][y] = temp;
                isChess = isChessTemp;
                return;
              }
            }
          }
        }
        if(isForTest){
          isChessMate = false;
          chess[x + (dx)][y + (dy)] = temp1;
          chess[x][y] = temp;
          isChess = isChessTemp;
        }
        else{
          chess[x][y] = temp;
          isChess = isChessTemp;
          chess[x + (dx)][y + (dy)] = temp1;
          chess[x + (dx)][y + (dy)].type = 2;
        }
      }
    }
  }
}