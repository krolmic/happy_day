part of '../edit_structure_page.dart';

class Stepper extends StatefulWidget {
  const Stepper({
    required this.pages,
    required this.onCompleted,
    required this.onNextStep,
    super.key,
  });

  final List<Widget> pages;

  final VoidCallback onNextStep;
  final VoidCallback onCompleted;

  @override
  StepperState createState() => StepperState();
}

class StepperState extends State<Stepper> {
  PageController? _controller = PageController();

  int currentStep = 0;

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

  void onStepNext() {
    if (!_isLast(currentStep)) {
      setState(() {
        currentStep++;
      });
      FocusScope.of(context).unfocus();

      switchToPage(currentStep);
    } else {
      widget.onCompleted();
    }
  }

  void onStepBack() {
    if (!_isFirst(currentStep)) {
      setState(() {
        currentStep--;
      });
      switchToPage(currentStep);
    }
  }

  void onPageChanged(int index) {
    FocusManager.instance.primaryFocus?.unfocus();

    toastification.dismissAll();

    if (_isLast(index)) {
      widget.onNextStep();
    }

    setState(() {
      currentStep = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dotsIndicator = AppDotsIndicator(
      dotsCount: widget.pages.length,
      position: currentStep,
    );

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: _isFirst(currentStep) ? null : onStepBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: _isFirst(currentStep)
                      ? HappyDayTheme.secondaryColorWithTransparency
                      : HappyDayTheme.secondaryColor,
                ),
              ),
              dotsIndicator,
              BlocBuilder<EditStructureBloc, EditStructureState>(
                buildWhen: (previous, current) =>
                    previous.isTitleValid != current.isTitleValid ||
                    previous.status != current.status,
                builder: (context, state) {
                  final isEnabled = state.isTitleValid;

                  return IconButton(
                    onPressed: isEnabled ? onStepNext : null,
                    icon: state.status.isLoadingOrSuccess
                        ? LoadingIndicator.small()
                        : Icon(
                            _isLast(currentStep)
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

class StepperPage extends StatelessWidget {
  const StepperPage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        constraints: const BoxConstraints(
          maxWidth: maxViewWidth,
        ),
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}
