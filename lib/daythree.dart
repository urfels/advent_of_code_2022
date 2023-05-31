import 'dart:convert';
import 'dart:io';

daythreeChapOne() async {
  final file = File("assets/three.txt");
  List same = [];
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    var i = 0;
    await for (var line in lines) {
      String samestring = "";
      i += 1;
      int length = line.length;
      int half = length ~/ 2;
      List<String> list = [line.substring(0, half), line.substring(half)];

      for (var element in list[0].runes) {
        if (list[1].contains(String.fromCharCode(element))) {
          samestring = String.fromCharCode(element);
        }
      }
      if (samestring != "") {
        same.add(samestring);
      }
    }
    int sum = 0;
    for (String letter in same) {
      if (letter == letter.toUpperCase()) {
        int value = letter.codeUnitAt(0) - 38;
        sum += value;
      } else {
        int value = letter.codeUnitAt(0) - 96;
        sum += value;
      }
    }
    print(sum);
  } catch (e) {
    print('Error: $e');
  }
}

dayThreeChapterTwo() async {
  int count = 0;
  String samestring = "";
  final file = File("assets/three.txt");
  List<String> list = [];
  List same = [];
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      list.add(line);
    }
  } catch (e) {
    print('Error: $e');
  }
  for (var i = 0; i < list.length - 2;) {
    for (var element in list[i].runes) {
      if (list[i + 1].contains(String.fromCharCode(element)) &&
          list[i + 2].contains(String.fromCharCode(element))) {
        samestring = String.fromCharCode(element);
      }
    }
    if (samestring != "") {
      same.add(samestring);
    }

    i = i + 3;
  }
  for (String letter in same) {
    if (letter == letter.toUpperCase()) {
      int value = letter.codeUnitAt(0) - 38;
      count += value;
    } else {
      int value = letter.codeUnitAt(0) - 96;
      count += value;
    }
  }
  print(same.length);
  print(count);
}
