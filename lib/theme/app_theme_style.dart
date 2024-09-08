import 'package:balancee_app/utils/font_manager.dart';
import 'package:balancee_app/utils/pallet.dart';
import 'package:balancee_app/utils/style_manager.dart';
import 'package:balancee_app/utils/value_manager.dart';
import 'package:balancee_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BalanceeThemeStyle {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      indicatorColor: Colors.grey,
      dialogBackgroundColor: Colors.grey.withOpacity(0.3),
      canvasColor: Pallet.white,
      dividerColor: Pallet.grey,
      primaryColor: Pallet.primary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Pallet.white,
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.black,
      disabledColor: Colors.black,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: AppSize.s0,
        shadowColor: Pallet.grey,
        backgroundColor: Pallet.white,
        titleTextStyle: getBoldStyle(
          fontSize: FontSize.s20,
          color: Pallet.primary,
          height: 25.0.toFigmaHeight(20),
        ),
        surfaceTintColor: Pallet.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Pallet.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
    );
  }
}
