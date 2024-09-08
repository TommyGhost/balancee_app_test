import 'package:balancee_app/utils/pallet.dart';
import 'package:balancee_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceeRadio extends StatelessWidget {
  final Function() onTap;
  final Function(String?) onChanged;
  final String value;
  final String groupValue;
  final String text;

  const BalanceeRadio(
      {super.key,
      required this.onTap,
      required this.onChanged,
      required this.value,
      required this.groupValue,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.w),
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 18.w,
              height: 18.h,
              child: Radio<String>(
                activeColor: Pallet.primary,
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            10.0.sbW,
            Text(text),
          ],
        ),
      ),
    );
  }
}
