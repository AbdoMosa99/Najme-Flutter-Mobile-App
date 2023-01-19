enum LanguageType { English, Arabic }

const String arabic = "ar";
const String english = "en";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.English:
        return english;
      case LanguageType.Arabic:
        return arabic;
    }
  }
}
