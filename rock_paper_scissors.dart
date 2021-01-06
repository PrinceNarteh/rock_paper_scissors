import 'dart:io';

import 'dart:math';

enum Move { rock, paper, scissors }

printResult(Move playerMove, Move aiMove) {
  print('Your move: $playerMove');
  print('AI move: $aiMove');
}

void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock, Paper or Scissors (r/p/s): ');
    final input = stdin.readLineSync();
    if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;
      if (input == 'r') {
        playerMove = Move.rock;
      } else if (input == 'p') {
        playerMove = Move.paper;
      } else {
        playerMove = Move.scissors;
      }
      final random = rng.nextInt(3);
      final aiMove = Move.values[random];
      if (playerMove == aiMove) {
        print("It's a Draw");
        printResult(playerMove, aiMove);
      } else if (playerMove == Move.rock && aiMove == Move.scissors ||
          playerMove == Move.paper && aiMove == Move.rock ||
          playerMove == Move.scissors && aiMove == Move.paper) {
        print('You win!');
        printResult(playerMove, aiMove);
      } else {
        print('AI Win!');
        printResult(playerMove, aiMove);
      }
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid input.');
    }
  }
}
