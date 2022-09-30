import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/model/language/language.dart';
import '../translations/lanuages.dart';

Future<Map<String, Map<String, String>>> init() async {
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppLanguages.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> convertJson = {};
    mappedJson.forEach((key, value) {
      convertJson[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        convertJson;
  }
  return languages;
}
