import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final String tooltip;

  const FloatingActionButtonWidget(
      { Key? key, required this.onPressed, required this.child, required this.tooltip,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        child: child,
      ),
    );
  }
}
