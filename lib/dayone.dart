import 'dart:convert';
import 'dart:io';

Future<List> dayOne() async {
  int calories = 0;
  List list = [];
  final file = File("assets/one.txt");
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      if (line.isEmpty) {
        list.add(calories);
        calories = 0;
      } else {
        calories = calories + int.parse(line);
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  return list;
}

dayonechptwo() async {
  List list = await dayOne();
  print(list.length);
  for (var i = 0; i < list.length; i++) {
    print('test');
    for (var j = 0; j < list.length - 1; j++) {
      if (list[j] < list[j + 1]) {
        var temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        print('swap');
      }
    }
  }
  int max = list[0] + list[1] + list[2];
  print(max);
}
