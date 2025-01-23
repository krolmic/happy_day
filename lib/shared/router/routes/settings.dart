part of '../router.dart';

final _settingsRoute = GoRoute(
  name: RoutesNames.settings,
  path: '/${RoutesNames.settings}',
  builder: (context, state) => const SettingsPage(),
);
