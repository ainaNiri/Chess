import 'package:chess/models/chess_type.dart';

void transform(List<List<ChessPiece>> chess){
  for(int i = 0; i < chess.length; i++){
    for(int j = 0; j < chess.length; j++){
      chess[i][j].type = 0;
    }
  }
}

void onChessTapped( int i, int j, List<List<ChessPiece>> chess){
  if(chess[i][j].type != 3){
    transform(chess);
    chess[i][j].move(i, j, chess);
    chess[i][j].type = 3;
  }
  else{
    transform(chess);
  }
}