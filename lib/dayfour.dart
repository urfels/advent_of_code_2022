import 'dart:convert';
import 'dart:io';

dayFourChapterOne() async {
  final file = File("assets/four.txt");
  // List<String> list = [];
  int count = 0;
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      List<String> list = line.split(",");
      List<String> list2 = list[0].split("-");
      List<String> list3 = list[1].split("-");

      int firstint = int.parse(list2[0]);
      int secondint = int.parse(list2[1]);
      int third = int.parse(list3[0]);
      int fourth = int.parse(list3[1]);
      if ((firstint <= third && fourth <= secondint) ||
          (third <= firstint && secondint <= fourth)) {
        count += 1;
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  print(count);
}

dayFourChapterTwo() async {
  final file = File("assets/four.txt");
  // List<String> list = [];
  int count = 0;
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(const LineSplitter()); // Convert stream to individual lines.
  try {
    await for (String line in lines) {
      List<String> list = line.split(",");
      List<String> list2 = list[0].split("-");
      List<String> list3 = list[1].split("-");

      int firstint = int.parse(list2[0]);
      int secondint = int.parse(list2[1]);
      int third = int.parse(list3[0]);
      int fourth = int.parse(list3[1]);
      if ((firstint <= third && fourth <= secondint) ||
          (third <= firstint && secondint <= fourth) ||
          (firstint <= fourth && secondint >= third) ||
          (third <= secondint && fourth >= firstint)) {
        count += 1;
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  print(count);
}
