import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/daily_structures/cubit/structures_display_setting_cubit.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:mocktail/mocktail.dart';
import 'package:structures_api/structures_api.dart';

import '../../helpers/helpers.dart';

class MockDailyStructuresCubit extends MockCubit<DailyStructuresState>
    implements DailyStructuresCubit {}

class MockStructuresDisplaySettingCubit
    extends MockCubit<StructuresDisplaySettingState>
    implements StructuresDisplaySettingCubit {}

void main() {
  group('DailyStructuresPage', () {
    late DailyStructuresCubit dailyStructuresCubit;
    late StructuresDisplaySettingCubit structuresDisplaySettingCubit;

    setUpAll(() {
      registerFallbackValue(Structure.empty());
    });

    setUp(() {
      dailyStructuresCubit = MockDailyStructuresCubit();
      structuresDisplaySettingCubit = MockStructuresDisplaySettingCubit();
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

      when(() => structuresDisplaySettingCubit.state)
          .thenReturn(StructuresDisplaySettingState.all);
      when(() => dailyStructuresCubit.state).thenReturn(state);
      when(() => dailyStructuresCubit.getAvailableStructures())
          .thenReturn(structures);
      when(() => dailyStructuresCubit.getUnavailableStructures())
          .thenReturn([]);
      when(() => dailyStructuresCubit.isStructureStarted(any()))
          .thenReturn(false);

      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: dailyStructuresCubit,
            ),
            BlocProvider.value(
              value: structuresDisplaySettingCubit,
            ),
          ],
          child: const DailyStructuresView(),
        ),
      );
      expect(find.byType(DailyStructures), findsExactly(2));
    });
  });
}
