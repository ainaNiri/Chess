import 'package:chess/models/chess_type.dart';

class Blank extends ChessPiece{
  Blank(int type) : super(player: Player.none, type: type, piece: " ");
  
}