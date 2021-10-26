enum Player {p1, p2, none}

class ChessPiece{
  Player player;
  int type;
  String? piece;
  ChessPiece({required this.player, required this.type, this.piece}) : super();

  void move(int x, int y, List<List<ChessPiece>> chess){
    
  }

}

void moveChess(int scoop, int x, int y, int dx, int dy, List<List<ChessPiece>> chess){
  int i = 1;
  while( i < scoop){
    if(x + (dx*i) >=0 &&  y + (dy*i) >= 0 && x + (dx*i) < chess.length &&  y + (dy*i) < chess.length){
      if(chess[x + (dx*i)][y + (dy*i)].player == Player.none){
        chess[x + (dx*i)][y + (dy*i)].type = 2;
      }
      else if(chess[x + (dx*i)][y + (dy*i)].player != chess[x][y].player){
        chess[x + (dx*i)][y + (dy*i)].type = 3;
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