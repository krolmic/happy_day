import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:happy_day/app/view/app.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

Future<void> bootstrap({
  required StructuresApi structuresApi,
  required StepsGenerationRepository stepsGenerationRepository,
  required void Function(FlutterErrorDetails) onFatalError,
  required void Function(Object, StackTrace) onError,
  required LogTree logTree,
  required bool sendCrashlyticsReports,
}) async {
  FlutterError.onError = onFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    onError(error, stack);
    return true;
  };

  Fimber.plantTree(logTree);

  final structuresRepository =
      StructuresRepository(structuresApi: structuresApi);

  if (sendCrashlyticsReports) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  runApp(
    App(
      structuresRepository: structuresRepository,
      stepsGenerationRepository: stepsGenerationRepository,
    ),
  );
}
