library intl_utils_formatter;

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

/// This script is used to format and sort (by accending) the arb files in the l10n directory
Future<void> sortFile(String filePath) async {
  String contents = await File(filePath).readAsString();

  if (contents.isEmpty) {
    print('| ❗ File: $filePath is empty');
    return;
  }

  Map<String, dynamic> arbData = json.decode(contents);

  Map<String, dynamic> formattedArbData = formatArbData(arbData);

  String jsonOutput =
      const JsonEncoder.withIndent('  ').convert(formattedArbData);

  await File(filePath).writeAsString(jsonOutput);
  print('| 💥 Formatted $filePath');
}

Map<String, dynamic> formatArbData(Map<String, dynamic> arbData) {
  const metadataIndicator = '@@';
  var localeMetadataKey =
      arbData.keys.firstWhere((k) => k.startsWith(metadataIndicator));

  var sortedKeys = arbData.keys
      .where((k) => !k.startsWith('@') && k != localeMetadataKey)
      .toList()
    ..sort();

  var formattedArbData = <String, dynamic>{};

  formattedArbData[localeMetadataKey] = arbData[localeMetadataKey];

  for (var key in sortedKeys) {
    formattedArbData[key] = arbData[key];

    var metadataKey = '@$key';
    if (arbData.containsKey(metadataKey)) {
      formattedArbData[metadataKey] = arbData[metadataKey];
    }
  }

  return formattedArbData;
}
