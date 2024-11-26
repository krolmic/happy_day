part of '../edit_structure_page.dart';

class Steps extends StatefulWidget {
  const Steps({
    required this.stepsColor,
    super.key,
  });

  final Color stepsColor;

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  TextEditingController _getController(String id, String initialText) {
    return _controllers.putIfAbsent(id, () {
      final controller = TextEditingController(text: initialText);
      // Prevent cursor jumping to end
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
      return controller;
    });
  }

  List<Widget> _getSkeletonStepsItems() {
    return List.generate(
      6,
      (index) => Padding(
        key: Key('skeleton-padding-$index'),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: StepsItem(
          key: Key('skeleton-step-$index'),
          index: index,
          stepsColor: widget.stepsColor,
          initialTitle: '',
          controller: TextEditingController(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final stepsColor = widget.stepsColor;

    return BlocListener<EditStructureBloc, EditStructureState>(
      listenWhen: (previous, current) =>
          previous.steps.length != current.steps.length ||
          !listEquals(
            previous.steps.map((e) => e.id).toList(),
            current.steps.map((e) => e.id).toList(),
          ),
      listener: (context, state) {
        _controllers.removeWhere(
          (id, _) => !state.steps.any((step) => step.id == id),
        );
      },
      child: BlocBuilder<EditStructureBloc, EditStructureState>(
        buildWhen: (previous, current) =>
            previous.stepsGenerationStatus != current.stepsGenerationStatus ||
            previous.steps.length != current.steps.length ||
            !listEquals(
              previous.steps.map((e) => e.id).toList(),
              current.steps.map((e) => e.id).toList(),
            ),
        builder: (context, state) {
          if (state.stepsGenerationStatus.isLoading) {
            return Skeletonizer(
              child: Column(
                children: _getSkeletonStepsItems(),
              ),
            );
          }

          return ReorderableColumn(
            padding: const EdgeInsets.only(bottom: 100),
            crossAxisAlignment: CrossAxisAlignment.start,
            draggedItemBuilder: (context, index) => StepsItem(
              key: Key(state.steps[index].id),
              index: index,
              initialTitle: state.steps[index].title,
              stepsColor: stepsColor,
              controller: _getController(
                state.steps[index].id,
                state.steps[index].title,
              ),
            ),
            children: List.generate(
              state.steps.length,
              (index) => Padding(
                key: Key(state.steps[index].id),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: StepsItem(
                  key: Key(state.steps[index].id),
                  index: index,
                  initialTitle: state.steps[index].title,
                  stepsColor: stepsColor,
                  controller: _getController(
                    state.steps[index].id,
                    state.steps[index].title,
                  ),
                ),
              ),
            ),
            onReorder: (oldIndex, newIndex) {
              context.read<EditStructureBloc>().add(
                    EditStructureEvent.stepReordered(oldIndex, newIndex),
                  );
            },
          );
        },
      ),
    );
  }
}

class StepsItem extends StatelessWidget {
  const StepsItem({
    required this.stepsColor,
    required this.index,
    required this.initialTitle,
    required this.controller,
    super.key,
  });

  final Color stepsColor;
  final int index;
  final String initialTitle;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Dismissible(
      key: key!,
      background: Container(
        decoration: BoxDecoration(
          color: stepsColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      behavior: HitTestBehavior.deferToChild,
      onDismissed: (direction) {
        context.read<EditStructureBloc>().add(
              EditStructureEvent.stepRemoved(index),
            );
      },
      child: ListTile(
        tileColor: stepsColor.withOpacity(0.1),
        leading: CircleAvatar(
          backgroundColor: stepsColor,
          child: Text(
            '${index + 1}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        trailing: Icon(Icons.drag_handle, color: stepsColor),
        title: TextFormField(
          controller: controller,
          cursorColor: stepsColor,
          decoration: InputDecoration(
            labelText: l10n.editStructureStepLabel,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(color: stepsColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: stepsColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: stepsColor),
            ),
            filled: true,
            fillColor: theme.colorScheme.surface.withOpacity(0.75),
            counterText: '',
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          maxLength: 50,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
          ],
          onChanged: (value) {
            context.read<EditStructureBloc>().add(
                  EditStructureEvent.stepChanged(
                    index,
                    value,
                  ),
                );
          },
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          right: 20,
          top: 10,
          bottom: 10,
        ),
      ),
    );
  }
}
