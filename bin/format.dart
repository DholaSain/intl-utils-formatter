// ignore_for_file: avoid_print

import 'dart:io';

import 'package:intl_utils_formatter/intl_utils_formatter.dart';
import 'package:yaml/yaml.dart';

Future<void> main(List<String> args) async {
  final File file = File('pubspec.yaml');
  final String pubspecContent = await file.readAsString();
  final YamlMap pubspecYaml = loadYaml(pubspecContent);

  final YamlMap? arbConfig = pubspecYaml['intl_utils_formatter'];

  if (arbConfig == null) {
    print('❌ intl_utils_formatter is not defined in pubspec.yaml');
    return;
  }
  if (arbConfig['files'] is List) {
    try {
      print('|------------------- 🧲 Formatting 🧲 -------------------|');
      final List<dynamic> files = arbConfig['files'];
      for (var file in files) {
        if (file is String) {
          await sortFile(file);
        }
      }
      print('|------------------- ✅    Done    ✅ -------------------|');
    } catch (e) {
      print('| 🚫 Error formatting: $e');
      print('|------------------- ❌   Failed   ❌ -------------------|');
    }
  } else {
    print('❌ intl_utils_formatter files should be a list of file paths');
  }
}
