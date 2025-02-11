import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:happy_day/bootstrap.dart';
import 'package:happy_day/firebase_options_dev.dart';
import 'package:happy_day/shared/logging.dart';
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

  Bloc.observer = const LoggingBlocObserver();

  final logTree = DebugTree(
    logLevels: DebugTree.defaultLevels.toList()..add('V'),
    useColors: true,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  const stepsGenerationRepository = FakeStepsGenerationRepository();

  return bootstrap(
    structuresApi: structuresApi,
    stepsGenerationRepository: stepsGenerationRepository,
    onboardingRepository: onboardingRepository,
    onFatalError: (details) {
      Fimber.e(details.exceptionAsString(), stacktrace: details.stack);
    },
    onError: (error, stackTrace) {
      Fimber.e(error.toString(), stacktrace: stackTrace);
    },
    logTree: logTree,
    sendCrashlyticsReports: false,
  );
}
