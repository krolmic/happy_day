part of '../structure_details_page.dart';

class Header extends StatelessWidget {
  const Header({
    required this.structure,
    super.key,
  });

  final Structure structure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = Color(structure.color);

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              structure.title,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            if (structure.hasDescription)
              Text(
                structure.description!,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
