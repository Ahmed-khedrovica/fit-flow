import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../storage/app_boxes.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale(AppBoxes.localeCode));

  void changeLocale(String languageCode) async {
    await AppBoxes.setLocaleCode(languageCode);
    emit(Locale(languageCode));
  }
}
