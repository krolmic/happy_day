import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:mocktail/mocktail.dart';
import 'package:structures_api/structures_api.dart';

import '../../helpers/helpers.dart';

class MockDailyStructuresCubit extends MockCubit<DailyStructuresState>
    implements DailyStructuresCubit {}

void main() {
  group('DailyStructuresPage', () {
    late DailyStructuresCubit dailyStructuresCubit;

    setUpAll(() {
      registerFallbackValue(Structure.empty());
    });

    setUp(() {
      dailyStructuresCubit = MockDailyStructuresCubit();
    });

    testWidgets('renders Structures', (tester) async {
      final structures = [
        Structure.empty(),
        Structure.empty(),
      ];
      final state = DailyStructuresState(
        structuresStatus: DailyStructuresStatus.success,
        structures: structures,
        date: DateTime.now(),
        structuresOfADayStatus: StructuresOfADayStatus.success,
        structuresOfADay: [],
      );
      when(() => dailyStructuresCubit.state).thenReturn(state);
      when(() => dailyStructuresCubit.getSortedStructures())
          .thenReturn(structures);
      when(() => dailyStructuresCubit.getActiveStructures(any()))
          .thenReturn(structures);
      when(() => dailyStructuresCubit.getOnlyEditableStructures(any()))
          .thenReturn([]);
      when(() => dailyStructuresCubit.canStructureOnlyBeEdited(any()))
          .thenReturn(false);
      await tester.pumpApp(
        BlocProvider.value(
          value: dailyStructuresCubit,
          child: const DailyStructuresView(),
        ),
      );
      expect(find.byType(DailyStructures), findsOneWidget);
    });
  });
}
