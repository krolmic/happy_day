import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_day/l10n/l10n.dart';
import 'package:happy_day/shared/router/routes_names.dart';
import 'package:happy_day/shared/widgets/expandable_floating_action_button.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(RoutesNames.settings),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: navigationShell,
      floatingActionButton: const ExpandableFloatingActionButton(),
      floatingActionButtonLocation: ExpandableFab.location,
      bottomNavigationBar: _BottomNavigationBar(
        key: const ValueKey('FloatingBottomNavigationBar'),
        onDestinationSelected: _goBranch,
        selectedIndex: navigationShell.currentIndex,
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    required this.onDestinationSelected,
    required this.selectedIndex,
    super.key,
  });

  final dynamic Function(int) onDestinationSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context);

    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      destinations: <Widget>[
        NavigationDestination(
          selectedIcon: const Icon(Icons.list),
          icon: const Icon(Icons.list_outlined),
          label: translations.manage,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.calendar_today),
          icon: const Icon(Icons.calendar_today_outlined),
          label: translations.timeline,
        ),
      ],
    );
  }
}
