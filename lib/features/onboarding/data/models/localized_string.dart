import 'package:hive/hive.dart';

part 'localized_string.g.dart';

@HiveType(typeId: 1)
class LocalizedString {
  @HiveField(0)
  final String en;
  @HiveField(1)
  final String ar;

  LocalizedString({
    required this.en,
    required this.ar,
  });

  factory LocalizedString.fromJson(Map<String, dynamic> json) {
    return LocalizedString(
      en: json['en'] as String,
      ar: json['ar'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ar': ar,
    };
  }

  String get(String languageCode) {
    return languageCode == 'ar' ? ar : en;
  }
}
