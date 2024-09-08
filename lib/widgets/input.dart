import 'package:balancee_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final AutovalidateMode? autovalidateMode;
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    this.autovalidateMode,
    this.label = '',
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(      
      style: getRegularStyle(
          fontSize: FontSize.s18,
          color: Pallet.black,
          height: 21.0.toFigmaHeight(18)),
      showCursor: true,
      cursorColor: Pallet.primary,
      validator: validator,
      maxLines: 1,
      autovalidateMode: autovalidateMode,
      controller: controller,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Pallet.grey),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Pallet.primary),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
        labelText: label,
        labelStyle: getRegularStyle(height: 16.0.toFigmaHeight(14), color: Pallet.primary),
        isDense: true,
        errorMaxLines: 3,
        contentPadding: pad(vert: AppPadding.p16, horiz: AppPadding.p16),
        // filled: true,
      ),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
