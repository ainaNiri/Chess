import 'package:chess/models/chess_type.dart';
import 'package:chess/models/roi.dart';
import 'package:chess/utilities/variable.dart';

class Cavalier extends ChessPiece{
  Cavalier(Player player, int type) : super(player: player, type: type, piece: player == Player.p1 ? "♘" : (player == Player.p2 ? "♞" : ""));

  @override
  void move(int x, int y, List<List<ChessPiece>> chess){
    moveCavalier(x, y, 1, -2, chess);
    moveCavalier(x, y, -1, -2, chess);
    moveCavalier(x, y, 1, 2, chess);
    moveCavalier(x, y, -1, 2, chess);
    moveCavalier(x, y, 2, 1, chess);
    moveCavalier(x, y, 2, -1, chess);
    moveCavalier(x, y, -2, 1, chess);
    moveCavalier(x, y, -2, -1, chess);
  }

  @override
  void test(int x, int y,  List<List<ChessPiece>> chess){
    if(testChess(x, y, 1, -2, chess)) return;
    if(testChess(x, y, -1, -2, chess)) return;
    if(testChess(x, y, 1, 2, chess)) return;
    if(testChess(x, y, -1, 2, chess)) return;
    if(testChess(x, y, 2, 1, chess)) return; 
    if(testChess(x, y, 2, -1, chess)) return;
    if(testChess(x, y, -2, 1, chess)) return;
    if(testChess(x, y, -2, -1, chess)) return;
  }
}

void moveCavalier(int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
  if(isChess){
    if(x + dx >= 0 && y + dy >= 0 && x + dx < chess.length && y + dy < chess.length){
      if(chessTemp[x + dx][y + dy] == 2){
        chess[x + dx][y + dy].type = 2;
      }
      else if(x + dx == chessMate[0][0] && y + dy == chessMate[0][1]){
        chess[x + dx][y + dy].type = 3;
      }
    }
  }
  else{
    for(int m = 0; m < piece.length; m++){
      if(piece[m][0] == x && piece[m][1] == y){
        return;
      }
    }
      
    if(x + dx >= 0 && y + dy >= 0 && x + dx < chess.length && y + dy < chess.length){
      if(chess[x + dx][y + dy].player == Player.none){
        chess[x + dx][y + dy].type = 2;
      }
      else if(chess[x + dx][y + dy].player != chess[x][y].player){
        chess[x + dx][y + dy].type = 3;
      }
    }
  }
}

bool testChess(int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
  if(x + dx >= 0 && y + dy >= 0 && x + dx < chess.length && y + dy < chess.length){
    if(chess[x + dx][y + dy].runtimeType == Roi && chess[x + dx][y + dy].player != chess[x][y].player){
      chessMate.add([x, y]);
      return true;
    }
  }
  return false;
}
