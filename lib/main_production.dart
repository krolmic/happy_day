import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/bootstrap.dart';
import 'package:happy_day/firebase_options_prod.dart';
import 'package:happy_day/shared/logging.dart';
import 'package:local_storage_structures_api/local_storage_structures_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final structuresApi = LocalStorageStructuresApi(
    plugin: await SharedPreferences.getInstance(),
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
    structuresApi: structuresApi,
    stepsGenerationRepository: stepsGenerationRepository,
    onFatalError: FirebaseCrashlytics.instance.recordFlutterFatalError,
    onError: FirebaseCrashlytics.instance.recordError,
    logTree: logTree,
    sendCrashlyticsReports: true,
  );
}
