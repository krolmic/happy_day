// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:steps_generation_repository/steps_generation_repository.dart';

void main() {
  group('StepsGenerationRepository', () {
    test('can be instantiated', () {
      expect(
        FakeStepsGenerationRepository(),
        isNotNull,
      );
    });
  });
}
