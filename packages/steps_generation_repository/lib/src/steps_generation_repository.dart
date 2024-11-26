import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:steps_generation_repository/src/steps_generation_client.dart';

/// Repository for generating steps for a given structure.
class StepsGenerationRepository {
  /// Creates a new [StepsGenerationRepository].
  const StepsGenerationRepository({
    required StepsGenerationClient client,
  }) : _client = client;

  final StepsGenerationClient _client;

  /// Generates steps for a given [structureTitle] and [structureDescription]
  /// in language with code [languageCode].
  Future<List<String>> generateSteps({
    required String structureTitle,
    required String structureDescription,
    required String languageCode,
  }) async {
    try {
      final response = await _client.generateSteps(
        structureTitle: structureTitle,
        structureDescription: structureDescription,
        languageCode: languageCode,
      );

      if (response == null) {
        throw const StepsGenerationRepositoryException('Response is empty');
      }

      if (jsonDecode(response) case {'result': final List<dynamic> items}) {
        return List<String>.from(items);
      } else if (jsonDecode(response) case {'error': final String error}) {
        throw StepsGenerationRepositoryException(error);
      }

      throw const StepsGenerationRepositoryException('Invalid JSON schema');
    } on GenerativeAIException {
      throw const StepsGenerationRepositoryException(
        'Problem with the Generative AI service',
      );
    } catch (e) {
      if (e is StepsGenerationRepositoryException) rethrow;

      throw const StepsGenerationRepositoryException();
    }
  }
}

/// Fake implementation of [StepsGenerationRepository].
class FakeStepsGenerationRepository implements StepsGenerationRepository {
  /// Creates a new [FakeStepsGenerationRepository].
  const FakeStepsGenerationRepository();

  @override
  Future<List<String>> generateSteps({
    required String structureTitle,
    required String structureDescription,
    required String languageCode,
  }) async {
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 5));

    return [
      'Meditate',
      'Stretch for 5 minutes',
      'Plan your daily goals',
      'Work 1-3 hours (repeatable)',
      'Take a break / meditate / move',
      'Write down next steps',
    ];
  }

  @override
  StepsGenerationClient get _client => throw UnimplementedError();
}

/// Exception thrown by [StepsGenerationRepository].
class StepsGenerationRepositoryException implements Exception {
  /// Creates a new [StepsGenerationRepositoryException].
  const StepsGenerationRepositoryException([this.message = 'Unkown problem']);

  /// Message of the exception.
  final String message;

  @override
  String toString() => 'StepsGenerationRepositoryException: $message';
}
