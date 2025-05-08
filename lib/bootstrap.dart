import 'package:calendar_day_structures_api/calendar_day_structures_api.dart';
import 'package:calendar_day_structures_repository/calendar_day_structures_repository.dart';
import 'package:email_repository/email_repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:happy_day/app/view/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:onboarding_repository/onboarding_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:wiredash/wiredash.dart';

Future<void> bootstrap({
  required StructuresApi structuresApi,
  required CalendarDayStructuresApi calendarDayStructuresApi,
  required StepsGenerationRepository stepsGenerationRepository,
  required OnboardingRepository onboardingRepository,
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

  // Hive is already initialized in main_development.dart

  final structuresRepository =
      StructuresRepository(structuresApi: structuresApi);

  final calendarDayStructuresRepository = CalendarDayStructuresRepository(
    calendarDayStructuresApi: calendarDayStructuresApi,
  );

  const emailRepository = EmailRepository();

  if (sendCrashlyticsReports) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  const wiredashProjectId = String.fromEnvironment('WIREDASH_PROJECT_ID');
  const wiredashSecret = String.fromEnvironment('WIREDASH_SECRET');

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(
    Wiredash(
      projectId: wiredashProjectId,
      secret: wiredashSecret,
      child: App(
        structuresRepository: structuresRepository,
        calendarDayStructuresRepository: calendarDayStructuresRepository,
        stepsGenerationRepository: stepsGenerationRepository,
        onboardingRepository: onboardingRepository,
        emailRepository: emailRepository,
      ),
    ),
  );
}
