import 'dart:convert';
import 'dart:io';

dayTwoChapone() async {
  int score = 0;
  final file = File("assets/two.txt");
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      List round = line.split(" ");
      print(round);
      if (round[1] == "X") {
        score += 1;
        if (round[0] == "A") {
          score += 3;
        } else if (round[0] == "C") {
          score += 6;
        } else {}
      } else if (round[1] == "Y") {
        score += 2;
        if (round[0] == "B") {
          score += 3;
        } else if (round[0] == "A") {
          score += 6;
        } else {}
      } else if (round[1] == "Z") {
        score += 3;
        if (round[0] == "C") {
          score += 3;
        } else if (round[0] == "B") {
          score += 6;
        } else {}
      }
    }
    print(score);
  } catch (e) {
    print('Error: $e');
  }
}

daytwochaptwo() async {
  int score = 0;
  final file = File("assets/two.txt");
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      List round = line.split(" ");
      if (round[1] == "X") {
        score += getLose(round);
      } else if (round[1] == "Y") {
        score += getDraw(round);
      } else if (round[1] == "Z") {
        score += getWin(round);
      }
    }
    print(score);
  } catch (e) {
    print('Error: $e');
  }
}

int getLose(List round) {
  int score = 0;
  if (round[0] == "A") {
    score += 3;
  } else if (round[0] == "B") {
    score += 1;
  } else if (round[0] == "C") {
    score += 2;
  }

  return score;
}

int getDraw(List round) {
  int score = 3;
  if (round[0] == "A") {
    score += 1;
  } else if (round[0] == "B") {
    score += 2;
  } else if (round[0] == "C") {
    score += 3;
  }

  return score;
}

int getWin(List round) {
  int score = 6;
  if (round[0] == "A") {
    score += 2;
  } else if (round[0] == "B") {
    score += 3;
  } else if (round[0] == "C") {
    score += 1;
  }

  return score;
}
