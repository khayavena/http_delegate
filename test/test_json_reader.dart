import 'dart:io';

String jsonReader(String path, String fileName) {
  final strings = File('$path$fileName').readAsLinesSync();
  final trimmed = strings.map((e) => e.trim());
  return trimmed.join();
}
