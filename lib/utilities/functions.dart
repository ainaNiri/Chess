import 'package:chess/models/chess_type.dart';
import 'package:chess/utilities/variable.dart';

void transform(List<List<ChessPiece>> chess){
  for(int i = 0; i < chess.length; i++){
    for(int j = 0; j < chess.length; j++){
      chess[i][j].type = caseType[i][j];
    }
  }
}

void onChessTapped( int i, int j, List<List<ChessPiece>> chess){
  if(chess[i][j].type != 4){
    transform(chess);
    chess[i][j].move(i, j, chess);
    chess[i][j].type = 4;

  }
  else{
    transform(chess);
  }
}