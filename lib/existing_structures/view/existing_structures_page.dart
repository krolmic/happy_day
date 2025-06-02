import 'package:flutter/material.dart';

class ExistingStructuresPage extends StatelessWidget {
  const ExistingStructuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExistingStructuresView();
  }
}

class ExistingStructuresView extends StatelessWidget {
  const ExistingStructuresView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ExistingStructuresContent(),
      ),
    );
  }
}

class ExistingStructuresContent extends StatelessWidget {
  const ExistingStructuresContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
