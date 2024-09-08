import 'package:balancee_app/utils/font_manager.dart';
import 'package:balancee_app/utils/pallet.dart';
import 'package:balancee_app/utils/style_manager.dart';
import 'package:balancee_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { fill, outline }

class BalanceeButton extends StatelessWidget {
  final String title;
  final ButtonType? buttonType;
  final Function() onPressed;

  const BalanceeButton({
    Key? key,
    this.buttonType = ButtonType.fill,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  Color getBackgroundColor() {
    if (buttonType == ButtonType.outline) {
      return Pallet.white;
    } else if (buttonType == ButtonType.fill) {
      return Pallet.primary;
    } else {
      return Colors.transparent;
    }
  }

  Color getColor() {
    if (buttonType == ButtonType.fill) {
      return Pallet.white;
    } else if (buttonType == ButtonType.outline) {
      return Pallet.primary;
    } else {
      return Pallet.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getColor();
    final bgColor = getBackgroundColor();
    return SizedBox(
      width: width(context) * 0.45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: buttonType == ButtonType.outline
                ? const BorderSide(color: Pallet.primary)
                : BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: getMediumStyle(
            fontSize: FontSize.s14,
            height: 16.0.toFigmaHeight(14),
            color: color,
          ),
        ),
      ),
    );
  }
}
