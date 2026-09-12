import 'package:hive/hive.dart';
import 'localized_string.dart';
import 'localized_list.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 3)
class ExerciseModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final LocalizedString title;
  @HiveField(2)
  final String videoUrl;
  @HiveField(3)
  final LocalizedList formCues;

  ExerciseModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.formCues,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] as String,
      title: LocalizedString.fromJson(json['title'] as Map<String, dynamic>),
      videoUrl: json['video_url'] as String,
      formCues: LocalizedList.fromJson(
        json['form_cues'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title.toJson(),
      'video_url': videoUrl,
      'form_cues': formCues.toJson(),
    };
  }
}
