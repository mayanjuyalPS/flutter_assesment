import 'package:flutter/material.dart';
import 'package:flutter_assesment/constants/colors.dart';

class StepperWidget extends StatefulWidget {
  final Function(int) onValueChange;
  final int initialValue;
  final void Function()? onIncrementPress;
  final void Function()? onDecrementPress;
  const StepperWidget(
      {Key? key,
      required this.onValueChange,
      this.initialValue = 0,
      this.onDecrementPress,
      this.onIncrementPress})
      : super(key: key);

  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return StepperContainerWidget(
      initialValue: widget.initialValue,
      onValueChange: widget.onValueChange,
      onDecrementPress: widget.onDecrementPress,
      onIncrementPress: widget.onIncrementPress,
    );
  }
}

class StepperContainerWidget extends StatelessWidget {
  final Function(int) onValueChange;
  final int initialValue;
  final void Function()? onIncrementPress;
  final void Function()? onDecrementPress;
  const StepperContainerWidget(
      {Key? key,
      required this.onValueChange,
      required this.initialValue,
      this.onDecrementPress,
      this.onIncrementPress})
      : super(key: key);

  GestureDetector createStepperButton(
      {required IconData icon, required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 28,
        height: 24,
        decoration: const BoxDecoration(
          color: kAuthButtonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        createStepperButton(icon: Icons.remove, onPressed: onDecrementPress!),
        SizedBox(
          width: 20,
          child: Text(
            initialValue.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        createStepperButton(icon: Icons.add, onPressed: onIncrementPress!),
      ],
    );
  }
}
