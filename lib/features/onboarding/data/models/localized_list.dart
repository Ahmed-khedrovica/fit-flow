import 'package:hive/hive.dart';

part 'localized_list.g.dart';

@HiveType(typeId: 2)
class LocalizedList {
  @HiveField(0)
  final List<String> en;
  @HiveField(1)
  final List<String> ar;

  LocalizedList({
    required this.en,
    required this.ar,
  });

  factory LocalizedList.fromJson(Map<String, dynamic> json) {
    return LocalizedList(
      en: List<String>.from(json['en'] as List),
      ar: List<String>.from(json['ar'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ar': ar,
    };
  }

  List<String> get(String languageCode) {
    return languageCode == 'ar' ? ar : en;
  }
}
