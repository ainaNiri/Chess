import 'package:chess/models/chess_type.dart';

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

  void moveCavalier(int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
    if(x + dx >= 0 && y + dy >= 0 && x + dx < chess.length && y + dy < chess.length){
      if(chess[x + dx][y + dy].player == Player.none){
        chess[x + dx][y + dy].type = 2;
      }
      else if(chess[x + dx][y + dy].player != player){
        chess[x + dx][y + dy].type = 3;
      }
    }
  }
}