import 'package:flutter/material.dart';

class BalanceeInkWell extends StatelessWidget {
  const BalanceeInkWell({super.key, this.child, this.onTap});

  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: onTap,
      child: child,
    );
  }
}
