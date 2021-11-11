import 'package:chess/models/blank_case.dart';
import 'package:chess/models/chess_type.dart';
import 'package:chess/models/tour.dart';
import 'package:chess/models/fou.dart';
import 'package:chess/models/cavalier.dart';
import 'package:chess/models/pion.dart';
import 'package:chess/models/roi.dart';
import 'package:chess/models/reine.dart';

List<List<ChessPiece>> chessPiece = [
  [Tour(Player.p1, 1), Cavalier(Player.p1, 0), Fou(Player.p1, 1), Reine(Player.p1, 0), Roi(Player.p1, 1), Fou(Player.p1, 0), Cavalier(Player.p1, 1), Tour(Player.p1, 0)],
  [Pion(Player.p1, 0), Pion(Player.p1, 1), Pion(Player.p1, 0), Pion(Player.p1, 1), Pion(Player.p1, 0), Pion(Player.p1, 1), Pion(Player.p1, 0), Pion(Player.p1, 1),],
  [Blank(1), Blank(0), Blank(1), Blank(0), Blank(1), Blank(0), Blank(1), Blank(0),],
  [Blank(0), Blank(1), Blank(0), Blank(1), Blank(0), Blank(1), Blank(0), Blank(1),],
  [Blank(1), Blank(0), Blank(1), Blank(0), Blank(1), Blank(0), Blank(1), Blank(0),],
  [Blank(0), Blank(1), Blank(0), Blank(1), Blank(0), Blank(1), Blank(0), Blank(1),],
  [Pion(Player.p2, 1), Pion(Player.p2, 0), Pion(Player.p2, 1), Pion(Player.p2, 0), Pion(Player.p2, 1), Pion(Player.p2, 0), Pion(Player.p2, 1), Pion(Player.p2, 0),],
  [Tour(Player.p2, 0), Cavalier(Player.p2, 1), Fou(Player.p2, 0), Reine(Player.p2, 1), Roi(Player.p2, 0), Fou(Player.p2, 1), Cavalier(Player.p2, 0), Tour(Player.p2, 1)],
];

List<List<int>> chessTemp = List.generate(chessPiece.length, (i) => List.generate(chessPiece.length, (j) => chessPiece[i][j].type));

List<List<int>> caseType = [
  [1, 0, 1, 0, 1, 0, 1, 0],
  [0, 1, 0, 1, 0, 1, 0, 1],
  [1, 0, 1, 0, 1, 0, 1, 0],
  [0, 1, 0, 1, 0, 1, 0, 1],
  [1, 0, 1, 0, 1, 0, 1, 0],
  [0, 1, 0, 1, 0, 1, 0, 1],
  [1, 0, 1, 0, 1, 0, 1, 0],
  [0, 1, 0, 1, 0, 1, 0, 1], 
];

List<int> oldCaseSelected = [-1, -1];
List<int> newCaseSelected = [-1, -1];
Player player = Player.p1;
bool isChess = false;
List<List<int>> chessMate = [];
List<List<int>> pieceChess = [];
List<List<int>> piece = [];
bool isChessMate = true;
bool isForTest = false;