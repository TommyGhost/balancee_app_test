import 'package:balancee_app/utils/font_manager.dart';
import 'package:balancee_app/utils/pallet.dart';
import 'package:balancee_app/utils/sizes.dart';
import 'package:balancee_app/utils/style_manager.dart';
import 'package:balancee_app/utils/value_manager.dart';
import 'package:balancee_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

Widget toast(String message, {bool? success}) {
  return Padding(
    padding: pad(both: 20),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: pad(horiz: 10.0),
          width: double.infinity,
          height: 60.0,
          color: !success! ? Colors.red : Pallet.primary,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    !success
                        ? const Icon(
                            Icons.cancel,
                            size: AppSize.s25,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.check_circle,
                            size: AppSize.s25,
                            color: Colors.white,
                          ),
                    10.0.sbW,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            message.toUpperCase(),
                            style: getSemiBoldStyle(
                              color: Pallet.white,
                              fontSize: FontSize.s12,
                              height: 14.0.toFigmaHeight(12),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showCustomToast(String message, {bool success = false, num? time}) {
  // dialogLocation(message: message, success: success, time: time);
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 3),
    onDismiss: () {},
  );
}
