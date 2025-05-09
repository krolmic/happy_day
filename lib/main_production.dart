import 'package:calendar_day_structures_api/calendar_day_structures_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/bootstrap.dart';
import 'package:happy_day/firebase_options_prod.dart';
import 'package:happy_day/shared/logging.dart';
import 'package:hive/hive.dart';
import 'package:local_storage_structures_api/local_storage_structures_api.dart';
import 'package:onboarding_repository/onboarding_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  final onboardingRepository = OnboardingRepository(
    sharedPreferences: sharedPreferences,
  );

  final structuresApi = LocalStorageStructuresApi(
    plugin: sharedPreferences,
  );

  final calendarDayStructuresApi = HiveCalendarDayStructuresApi(
    calendarDayStructuresBox: await Hive.openBox('calendar_day_structures_box'),
  );

  Bloc.observer = const LoggingBlocObserver();

  final logTree = CrashlyticsTree();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final generativeModel =
      FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');
  final stepsGenerationRepository = StepsGenerationRepository(
    client: StepsGenerationClient(
      model: generativeModel,
    ),
  );

  return bootstrap(
    calendarDayStructuresApi: calendarDayStructuresApi,
    structuresApi: structuresApi,
    stepsGenerationRepository: stepsGenerationRepository,
    onboardingRepository: onboardingRepository,
    onFatalError: FirebaseCrashlytics.instance.recordFlutterFatalError,
    onError: FirebaseCrashlytics.instance.recordError,
    logTree: logTree,
    sendCrashlyticsReports: true,
  );
}
