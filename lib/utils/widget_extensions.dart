import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const ext = 0;

extension WidgetExtensions on double {
  Widget get sbH => SizedBox(height: h);
  Widget get sbW => SizedBox(width: w);
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

extension FigmaDimension on double {
  double toFigmaHeight(double fontSize) {
    return (this / fontSize).h;
  }
}
