import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_day/daily_structures/daily_structures.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockDailyStructuresCubit extends MockCubit<int>
    implements DailyStructuresCubit {}

void main() {
  group('DailyStructuresPage', () {
    late DailyStructuresCubit counterCubit;

    setUp(() {
      counterCubit = MockDailyStructuresCubit();
    });

    testWidgets('renders Structures', (tester) async {
      const state = 42;
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterCubit,
          child: const DailyStructuresView(),
        ),
      );
      expect(find.byType(Structures), findsOneWidget);
    });
  });
}
