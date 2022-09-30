import '../data/model/language/language.dart';
class AppLanguages {
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "assets/image/english.png",
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: "assets/image/arabic.png",
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
