import 'dart:convert';
import 'dart:io';

dayFiveChapterOne() async {
  final file = File("assets/five.txt");
  // List<String> list = [];
  String count = "";

  List<List> list1 = [
    ["Z", "P", "M", "H", "R"],
    ["P", "C", "J", "B"],
    ["S", "N", "H", "G", "L", "C", "D"],
    ["F", "T", "M", "D", "Q", "S", "R", "L"],
    ["F", "S", "P", "Q", "B", "T", "Z", "M"],
    ["T", "F", "S", "Z", "B", "G"],
    ["N", "R", "V"],
    ["P", "G", "L", "T", "D", "V", "C", "M"],
    ["W", "Q", "N", "J", "F", "M", "L"]
  ];

  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      List numbers = line.split(" ");
      print(numbers);
      int slaenge = int.parse(numbers[1]);
      int from = int.parse(numbers[3]) - 1;
      int to = int.parse(numbers[5]) - 1;

      for (int i = 1; i <= slaenge;) {
        String last = list1[from].last;

        list1[from].removeLast();
        list1[to].add(last);
        i += 1;
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  count = list1[0].last +
      list1[1].last +
      list1[2].last +
      list1[3].last +
      list1[4].last +
      list1[5].last +
      list1[6].last +
      list1[7].last +
      list1[8].last;

  print(count);
}

dayFiveChapterTwo() async {
  final file = File("assets/five.txt");
  // List<String> list = [];
  String count = "";

  List<List> list1 = [
    ["Z", "P", "M", "H", "R"],
    ["P", "C", "J", "B"],
    ["S", "N", "H", "G", "L", "C", "D"],
    ["F", "T", "M", "D", "Q", "S", "R", "L"],
    ["F", "S", "P", "Q", "B", "T", "Z", "M"],
    ["T", "F", "S", "Z", "B", "G"],
    ["N", "R", "V"],
    ["P", "G", "L", "T", "D", "V", "C", "M"],
    ["W", "Q", "N", "J", "F", "M", "L"]
  ];

  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      List numbers = line.split(" ");
      print(numbers);
      int slaenge = int.parse(numbers[1]);
      int from = int.parse(numbers[3]) - 1;
      int to = int.parse(numbers[5]) - 1;
      int index = list1[from].length - slaenge;
      for (int i = 1; i <= slaenge;) {
        print("index: " + index.toString());
        String last = list1[from][index];
        list1[from].removeAt(index);
        list1[to].add(last);
        i += 1;
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  count = list1[0].last +
      list1[1].last +
      list1[2].last +
      list1[3].last +
      list1[4].last +
      list1[5].last +
      list1[6].last +
      list1[7].last +
      list1[8].last;

  print(count);
}
