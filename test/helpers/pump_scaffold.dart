import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_app.dart';

extension PumpScaffold on WidgetTester {
  Future<void> pumpScaffold(Widget widget) {
    return pumpApp(
      Scaffold(
        body: widget,
      ),
    );
  }
}
