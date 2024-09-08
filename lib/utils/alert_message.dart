import 'package:balancee_app/utils/__utils.dart';
import 'package:balancee_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showAlertDialog(
  BuildContext context, {
  required String code,
  required Function() onTap,
  }) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
        actionsPadding: EdgeInsets.all(0.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        titlePadding: padOnly(top: 23),
        contentPadding: padOnly(top: 14, left: 10, right: 10),
        title: SizedBox(
          width: width(context),
          child: Column(
            children: [
              const Icon(
                Icons.card_giftcard_outlined,
                size: AppSize.s60,
                color: Pallet.black,
              ),
              24.0.sbH,
              Text(
                AppStrings.promoCode,
                style: getSemiBoldStyle(
                    color: Pallet.black,
                    fontSize: FontSize.s18,
                    height: 21.0.toFigmaHeight(18)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        content: SizedBox(
          height: 140.h,
          child: Column(
            children: [
              Text(
                'Your generated promo code is: ',
                style: getRegularStyle(
                  fontSize: FontSize.s14,
                  height: 16.94.toFigmaHeight(14),
                  color: Pallet.grey,
                ),
                textAlign: TextAlign.center,
              ),
              15.0.sbH,
              Text(
                code.toUpperCase(),
                style: getBoldStyle(
                  fontSize: FontSize.s20,
                  height: 25.0.toFigmaHeight(20),
                  color: Pallet.primary,
                ),
                textAlign: TextAlign.center,
              ),
              20.0.sbH,
              BalanceeButton(
                buttonType: ButtonType.fill,
                onPressed: onTap,
                title: AppStrings.ok,
              ),
            ],
          ),
        ),
      );
    },
  );
}
