import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_day/app/app_bloc_observer.dart';
import 'package:happy_day/app/view/app.dart';
import 'package:structures_api/structures_api.dart';
import 'package:structures_repository/structures_repository.dart';

void bootstrap({required StructuresApi structuresApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  };

  Bloc.observer = const AppBlocObserver();

  final structuresRepository =
      StructuresRepository(structuresApi: structuresApi);
  // Add cross-flavor configuration here

  runApp(App(structuresRepository: structuresRepository));
}
