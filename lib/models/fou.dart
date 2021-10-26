import 'package:chess/models/chess_type.dart';

class Fou extends ChessPiece{
  Fou(Player player, int type) : super(player : player, type : type, piece: player == Player.p1 ? "♗" : (player == Player.p2 ? "♝" : ""));

  @override
  void move(int x, int y, List<List<ChessPiece>> chess){
    moveChess(10 , x, y, 1, 1, chess);
    moveChess(10 , x, y, 1, -1, chess);
    moveChess(10 , x, y, -1, 1, chess);
    moveChess(10 , x, y, -1, -1, chess);
  }
}