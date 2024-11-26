import 'package:firebase_vertexai/firebase_vertexai.dart';

/// Client for generating steps for a structure
class StepsGenerationClient {
  /// Creates new [StepsGenerationClient]
  const StepsGenerationClient({
    required GenerativeModel model,
  }) : _model = model;

  final GenerativeModel _model;

  GenerationConfig get _generationConfig => GenerationConfig(
        responseMimeType: 'application/json',
        responseSchema: Schema.object(
          properties: {
            'result': Schema.array(items: Schema.string()),
          },
        ),
      );

  /// Generates steps for given [structureTitle] and [structureDescription]
  /// in language with code [languageCode].
  Future<String?> generateSteps({
    required String structureTitle,
    required String structureDescription,
    required String languageCode,
  }) async {
    final prompt =
        'Generate steps for a daily structure which I can track every day '
        'so it consists of done steps I want to track getting done and see '
        'my daily history in language with code "$languageCode". The structure '
        'is called "$structureTitle". The structure description says '
        '"$structureDescription". Return the steps in JSON format as a list, '
        'e.g. {"result": ["step 1 where to start", "step 2 next one", '
        '"step 3 next one", "step 4 next one"]}. Do not include the word '
        '"step" and its number in the list items. '
        'Each item should be max. 20 characters long. '
        "The steps shouldn't include recommendations, only concrete steps "
        'to execute. '
        'The list should contain max. 15 items, preferably not more than 10, '
        'if there is nothing else specified in the structure description. '
        "Consider given structure description only if it's understandable "
        "and it's related to its name. If the title is not understandable "
        'or steps could not get generated return {"error": "prompt failed"}';

    final response = await _model.generateContent(
      [Content.text(prompt)],
      generationConfig: _generationConfig,
    );

    return response.text;
  }
}
