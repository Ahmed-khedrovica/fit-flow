import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:flutter/services.dart' show appFlavor;
import 'package:flutter/widgets.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:fit_flow/features/onboarding/data/models/localized_string.dart';
import 'package:fit_flow/features/onboarding/data/models/localized_list.dart';
import 'package:fit_flow/features/onboarding/data/models/exercise_model.dart';
import 'package:fit_flow/features/onboarding/data/models/plan_model.dart';
import 'storage/app_boxes.dart';
import '../app.dart';
import 'config/app_config.dart';
import 'di/service_locator.dart';

Future<void> boot(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // Register Adapters
  Hive.registerAdapter(LocalizedStringAdapter());
  Hive.registerAdapter(LocalizedListAdapter());
  Hive.registerAdapter(ExerciseModelAdapter());
  Hive.registerAdapter(WorkoutExerciseModelAdapter());
  Hive.registerAdapter(WorkoutDayModelAdapter());
  Hive.registerAdapter(PlanModelAdapter());

  // Open Boxes
  await Hive.openBox<PlanModel>(AppBoxes.planBox);
  await Hive.openBox(AppBoxes.prefsBox);
  await Hive.openBox<int>(AppBoxes.setProgressBox);

  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    initServiceLocator(),
  ]);

  assert(
    appFlavor == null || appFlavor == config.environment.name,
    'Flavor mismatch: native=$appFlavor, dart=${config.environment.name}',
  );

  runApp(FitFlowApp(config: config));
}
