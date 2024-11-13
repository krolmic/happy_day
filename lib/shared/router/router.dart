import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/daily_structures/view/daily_structures_page.dart';
import 'package:happy_day/edit_structure/view/edit_structure_page.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/structure_details/view/structure_details_page.dart';
import 'package:structures_api/structures_api.dart';

part 'routes/daily_structures.dart';
part 'routes/edit_structure.dart';
part 'routes/structure_details.dart';

final goRouter = GoRouter(
  initialLocation: '/${RoutesNames.dailyStructures}',
  routes: [
    _dailyStructuresRoute,
    _structureDetailsRoute,
    _editStructureRoute,
  ],
);
