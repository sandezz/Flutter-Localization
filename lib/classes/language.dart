class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", "🇺🇸", "en"),
      Language(2, "עִברִית", "🇮🇱", "he"),
      Language(3, "हिन्दी", "🇮🇳", "hi"),
      Language(4, "عربى", "🇸🇦", "ar"),
      Language(5, "Español", "🇪🇸", "es")
    ];
  }
}
