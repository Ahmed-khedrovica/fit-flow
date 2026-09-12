import 'localized_string.dart';

class GoalModel {
  final String id;
  final LocalizedString title;
  final LocalizedString subtitle;

  GoalModel({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'] as String,
      title: LocalizedString.fromJson(json['title'] as Map<String, dynamic>),
      subtitle: LocalizedString.fromJson(json['subtitle'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title.toJson(),
      'subtitle': subtitle.toJson(),
    };
  }

  static List<GoalModel> skeletons() {
    return List.generate(
      3,
      (index) => GoalModel(
        id: 'skeleton_$index',
        title: LocalizedString(en: 'Loading Goal Title', ar: 'عنوان الهدف'),
        subtitle: LocalizedString(en: 'Loading subtitle text goes here', ar: 'نص فرعي للتحميل'),
      ),
    );
  }
}
