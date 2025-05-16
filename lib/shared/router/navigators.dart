part of 'router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorExistingStructuresKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellExistingStructures');
final _shellNavigatorDailyStructuresKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellDailyStructures');
