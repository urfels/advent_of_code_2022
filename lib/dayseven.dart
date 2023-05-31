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
    await for (String line in lines) {}
  } catch (e) {
    print('Error: $e');
  }

  print(count);
}
