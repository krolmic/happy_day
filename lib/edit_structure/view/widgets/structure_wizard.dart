part of '../edit_structure_page.dart';

class StructureWizard extends StatefulWidget {
  const StructureWizard({
    required this.pages,
    required this.onCompleted,
    required this.onNextStep,
    super.key,
  });

  final List<Widget> pages;

  final VoidCallback onNextStep;
  final VoidCallback onCompleted;

  @override
  StructureWizardState createState() => StructureWizardState();
}

class StructureWizardState extends State<StructureWizard> {
  final PageController _controller = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void>? switchToPage(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    return null;
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.pages.length - 1 == index;
  }

  void onPageNext() {
    if (!_isLast(currentPage)) {
      setState(() {
        currentPage++;
      });
      FocusScope.of(context).unfocus();

      switchToPage(currentPage);
    } else {
      widget.onCompleted();
    }
  }

  void onPageBack() {
    if (!_isFirst(currentPage)) {
      setState(() {
        currentPage--;
      });
      switchToPage(currentPage);
    }
  }

  void onPageChanged(int index) {
    FocusManager.instance.primaryFocus?.unfocus();

    toastification.dismissAll();

    if (_isLast(index)) {
      widget.onNextStep();
    }

    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.structureWizardColors;

    return Column(
      children: [
        Expanded(
          child: BlocBuilder<EditStructureBloc, EditStructureState>(
            buildWhen: (previous, current) =>
                previous.isTitleValid != current.isTitleValid,
            builder: (context, state) {
              return PageView(
                physics: state.isTitleValid
                    ? null
                    : const NeverScrollableScrollPhysics(),
                controller: _controller,
                onPageChanged: onPageChanged,
                children: widget.pages,
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BlocBuilder<EditStructureBloc, EditStructureState>(
                buildWhen: (previous, current) =>
                    previous.stepsGenerationStatus !=
                    current.stepsGenerationStatus,
                builder: (context, state) {
                  final isEnabled = !_isFirst(currentPage) &&
                      !state.stepsGenerationStatus.isLoading;

                  return IconButton(
                    onPressed: isEnabled ? onPageBack : null,
                    icon: Icon(
                      Icons.arrow_back,
                      color: isEnabled
                          ? colors.enabledControllsColor
                          : colors.disabledControllsColor,
                    ),
                  );
                },
              ),
              StepsIndicator(
                stepsCount: widget.pages.length,
                currentStep: currentPage + 1,
                selectCompletedSteps: true,
              ),
              BlocBuilder<EditStructureBloc, EditStructureState>(
                buildWhen: (previous, current) =>
                    previous.isTitleValid != current.isTitleValid ||
                    previous.editStatus != current.editStatus ||
                    previous.stepsGenerationStatus !=
                        current.stepsGenerationStatus,
                builder: (context, state) {
                  final isEnabled = state.isTitleValid &&
                      !state.stepsGenerationStatus.isLoading;

                  return IconButton(
                    onPressed: isEnabled ? onPageNext : null,
                    icon: state.editStatus.isLoadingOrSuccess
                        ? LoadingIndicator.small()
                        : Icon(
                            _isLast(currentPage)
                                ? Icons.check
                                : Icons.arrow_forward,
                            color: isEnabled
                                ? colors.enabledControllsColor
                                : colors.disabledControllsColor,
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StructureWizardPage extends StatelessWidget {
  const StructureWizardPage({
    required this.child,
    this.floatingActionButton,
    super.key,
  });

  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: child,
          ),
          if (floatingActionButton != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: floatingActionButton,
              ),
            ),
        ],
      ),
    );
  }
}

class StructureWizardColors extends ThemeExtension<StructureWizardColors> {
  StructureWizardColors({
    required this.enabledControllsColor,
    required this.disabledControllsColor,
  });

  StructureWizardColors.light()
      : this(
          enabledControllsColor: HappyDayTheme.secondaryColor,
          disabledControllsColor: HappyDayTheme.secondaryColorWithTransparency,
        );

  StructureWizardColors.dark()
      : this(
          enabledControllsColor: Colors.white,
          disabledControllsColor: Colors.white38,
        );

  final Color enabledControllsColor;
  final Color disabledControllsColor;

  @override
  ThemeExtension<StructureWizardColors> copyWith({
    Color? enabledControllsColor,
    Color? disabledControllsColor,
  }) {
    return StructureWizardColors(
      enabledControllsColor:
          enabledControllsColor ?? this.enabledControllsColor,
      disabledControllsColor:
          disabledControllsColor ?? this.disabledControllsColor,
    );
  }

  @override
  ThemeExtension<StructureWizardColors> lerp(
    ThemeExtension<StructureWizardColors>? other,
    double t,
  ) {
    if (other is! StructureWizardColors) return this;
    return StructureWizardColors(
      enabledControllsColor: Color.lerp(
        enabledControllsColor,
        other.enabledControllsColor,
        t,
      )!,
      disabledControllsColor: Color.lerp(
        disabledControllsColor,
        other.disabledControllsColor,
        t,
      )!,
    );
  }
}

extension StructureWizardColorsExtension on BuildContext {
  StructureWizardColors get structureWizardColors =>
      Theme.of(this).extension<StructureWizardColors>()!;
}
