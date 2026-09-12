import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/app_config.dart';
import 'core/cubit/locale_cubit.dart';
import 'core/theme/app_colors.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'generated/l10n.dart';

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key, required this.config});

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: config.appName,
            locale: locale,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.chromeBackground,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.splashBackground,
              ),
            ),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              if (deviceLocale == null) return supportedLocales.first;
              for (final supported in supportedLocales) {
                if (supported.languageCode == deviceLocale.languageCode) {
                  return supported;
                }
              }
              return supportedLocales.first;
            },
            home: Builder(
              builder: (context) {
                return SplashScreen();
              },
            ),
          );
        },
      ),
    );
  }
}

