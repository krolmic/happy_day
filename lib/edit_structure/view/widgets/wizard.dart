part of '../edit_structure_page.dart';

class Wizard extends StatefulWidget {
  const Wizard({
    required this.pages,
    required this.onCompleted,
    required this.onNextStep,
    super.key,
  });

  final List<Widget> pages;

  final VoidCallback onNextStep;
  final VoidCallback onCompleted;

  @override
  WizardState createState() => WizardState();
}

class WizardState extends State<Wizard> {
  PageController? _controller = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    _controller!.dispose();
    _controller = null;
    super.dispose();
  }

  Future<void>? switchToPage(int page) {
    _controller!.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
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
                          ? HappyDayTheme.secondaryColor
                          : HappyDayTheme.secondaryColorWithTransparency,
                    ),
                  );
                },
              ),
              ProgressIndicator(
                dotsCount: widget.pages.length,
                position: currentPage + 1,
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
                                ? HappyDayTheme.secondaryColor
                                : HappyDayTheme.secondaryColorWithTransparency,
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

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    required this.dotsCount,
    required this.position,
    super.key,
  });

  final int dotsCount;
  final int position;

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: dotsCount,
      currentStep: position,
      selectedColor: HappyDayTheme.secondaryColor,
      unselectedColor: HappyDayTheme.secondaryColorWithTransparency,
      selectedSize: 2.5,
      unselectedSize: 2.5,
    );
  }
}

class WizardPage extends StatelessWidget {
  const WizardPage({
    required this.child,
    this.floatingActionButton,
    super.key,
  });

  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      constraints: const BoxConstraints(
        maxWidth: maxViewWidth,
      ),
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
