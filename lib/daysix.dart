import 'dart:convert';
import 'dart:io';

daySixChapterOne() async {
  final file = File("assets/six.txt");
  // List<String> list = [];
  int count = 0;

  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      print(line.length);
      List list = line.split("");
      print(list.length);
      for (var i = 0; i < list.length - 3;) {
        if (list[i] != list[i + 1] &&
            list[i] != list[i + 2] &&
            list[i] != list[i + 3] &&
            list[i + 1] != list[i + 2] &&
            list[i + 1] != list[i + 3] &&
            list[i + 2] != list[i + 3]) {
          print(i + 4);
        }
        i += 1;
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  print(count);
}

daySixChapterTwo() async {
  final file = File("assets/six.txt");
  // List<String> list = [];
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      for (var i = 0; i < line.length - 14; i++) {
        bool has14unique = true;
        String str = line.substring(i, i + 14);
        str.runes.forEach((int rune) {
          var character = new String.fromCharCode(rune);
          if (str.indexOf(character) != str.lastIndexOf(character)) {
            has14unique = false;
          }
        });
        if (has14unique == true) {
          print(i + 14);
        }
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}
