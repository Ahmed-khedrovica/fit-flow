import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubit/locale_cubit.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: locale.languageCode,
        icon: const Icon(Icons.language, size: 20),
        borderRadius: BorderRadius.circular(12),
        onChanged: (newValue) {
          if (newValue == null) return;

          context.read<LocaleCubit>().changeLocale(newValue);
        },
        items: const [
          DropdownMenuItem(value: 'en', child: Text('EN')),
          DropdownMenuItem(value: 'ar', child: Text('AR')),
        ],
      ),
    );
  }
}
