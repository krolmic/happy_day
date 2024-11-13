import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/router/router.dart';
import 'package:happy_day/shared/theme.dart';
import 'package:structures_repository/structures_repository.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({required this.structuresRepository, super.key});

  final StructuresRepository structuresRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: structuresRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: HappyDayTheme.theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: goRouter,
      ),
    );
  }
}
