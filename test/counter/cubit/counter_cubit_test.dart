import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:happy_day/daily_structures/daily_structures.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(DailyStructuresCubit().state, equals(0));
    });

    blocTest<DailyStructuresCubit, int>(
      'emits [1] when increment is called',
      build: DailyStructuresCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<DailyStructuresCubit, int>(
      'emits [-1] when decrement is called',
      build: DailyStructuresCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
