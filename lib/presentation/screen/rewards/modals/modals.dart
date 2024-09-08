import 'package:balancee_app/presentation/base/base_ui.dart';
import 'package:balancee_app/presentation/screen/rewards/rewards_vm.dart';
import 'package:balancee_app/utils/__utils.dart';
import 'package:balancee_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DirectCashoutModal extends StatelessWidget {
  final double currentBalance;

  const DirectCashoutModal({super.key, required this.currentBalance});

  @override
  Widget build(BuildContext context) {
    return BaseView<RewardsViewModel>(
      builder: (context, model, child) => Padding(
        padding: pad(both: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '${AppStrings.direct} ${AppStrings.cashout}',
                    style: getBoldStyle(
                      fontSize: FontSize.s20,
                      color: Pallet.primary,
                      height: 25.0.toFigmaHeight(20),
                    ),
                  ),
                ),
                16.0.sbH,
                Text(
                  '${AppStrings.currBal}₦${NumberFormat("#,##0.00", "en_US").format(currentBalance)}',
                  style: getMediumStyle(
                    fontSize: FontSize.s14,
                    height: 16.0.toFigmaHeight(14),
                  ),
                ),
                15.0.sbH,
                InputField(
                  controller: model.amount,
                  label: AppStrings.amount2cash,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
                15.0.sbH,
                Text(
                  AppStrings.cashMet,
                  style: getMediumStyle(
                    fontSize: FontSize.s14,
                    height: 16.0.toFigmaHeight(14),
                  ),
                ),
                15.0.sbH,
                BalanceeRadio(
                  onTap: () => model.changeSelectedOption(AppStrings.bankAcc),
                  onChanged: (value) => model.changeSelectedOption(value!),
                  value: AppStrings.bankAcc,
                  groupValue: model.selectedOption,
                  text: AppStrings.withdrAcc,
                ),
                15.0.sbH,
                BalanceeRadio(
                  onTap: () => model.changeSelectedOption(AppStrings.disc),
                  onChanged: (value) => model.changeSelectedOption(value!),
                  value: AppStrings.disc,
                  groupValue: model.selectedOption,
                  text: AppStrings.discount,
                ),
                15.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BalanceeButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (model.formKey.currentState!.validate()) {
                          model.withdrawDirect(
                              context,
                              double.parse(model.amount.text.trim()),
                              currentBalance);
                        } else {
                          //
                        }
                      },
                      title: AppStrings.withdraw,
                    ),
                    BalanceeButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context);
                        model.amount.clear();
                      },
                      title: AppStrings.cancel,
                      buttonType: ButtonType.outline,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCodeModal extends StatelessWidget {
  final double currentBalance;

  const PromoCodeModal({super.key, required this.currentBalance});

  @override
  Widget build(BuildContext context) {
    return BaseView<RewardsViewModel>(
      builder: (context, model, child) => Padding(
        padding: pad(both: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppStrings.promoCode,
                    style: getBoldStyle(
                      fontSize: FontSize.s20,
                      color: Pallet.primary,
                      height: 25.0.toFigmaHeight(20),
                    ),
                  ),
                ),
                16.0.sbH,
                Text(
                  '${AppStrings.currBal}₦${NumberFormat("#,##0.00", "en_US").format(currentBalance)}',
                  style: getMediumStyle(
                    fontSize: FontSize.s14,
                    height: 16.0.toFigmaHeight(14),
                  ),
                ),
                15.0.sbH,
                InputField(
                  controller: model.amount,
                  label: AppStrings.amount2cash,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
                15.0.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BalanceeButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (model.formKey.currentState!.validate()) {
                          model.convertToPromoCode(
                              context,
                              double.parse(model.amount.text.trim()),
                              currentBalance);
                        } else {
                          //
                        }
                      },
                      title: AppStrings.confirm,
                    ),
                    BalanceeButton(
                      buttonType: ButtonType.outline,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context);
                        model.amount.clear();
                      },
                      title: AppStrings.cancel,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
