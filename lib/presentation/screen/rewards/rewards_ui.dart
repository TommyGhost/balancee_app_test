import 'package:balancee_app/domain/models/cashback_history_response.dart';
import 'package:balancee_app/presentation/base/base_ui.dart';
import 'package:balancee_app/presentation/screen/rewards/modals/modals.dart';
import 'package:balancee_app/presentation/screen/rewards/rewards_vm.dart';
import 'package:balancee_app/utils/__utils.dart';
import 'package:balancee_app/widgets/__widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RewardsViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          _closeApp(context);
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              AppStrings.rewardsSum,
            ),
            bottomOpacity: 0,
          ),
          body: SingleChildScrollView(
            padding: pad(vert: 0, horiz: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RewardCard(
                  totalCashback: model.totalCashback,
                  balance: model.balance,
                ),
                24.0.sbH,
                Text(
                  AppStrings.cashout,
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    height: 19.0.toFigmaHeight(16),
                    color: Pallet.primary,
                  ),
                ),
                15.0.sbH,
                OptionsCard(
                  onTapUp: () async {
                    final newBalance = await showModalBottomSheet<double>(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (context) => Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child:
                            DirectCashoutModal(currentBalance: model.balance),
                      ),
                    );

                    if (newBalance != null) {
                      // Update the model with the new balance if a new balance was returned
                      model.updateBalance(newBalance);
                    }
                  },
                  onTapDown: () async {
                    final newBalance = await showModalBottomSheet<double>(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (context) => Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: PromoCodeModal(currentBalance: model.balance),
                      ),
                    );

                    if (newBalance != null) {
                      // Update the model with the new balance if a new balance was returned
                      model.updateBalance(newBalance);
                    }
                  },
                ),
                24.0.sbH,
                Text(
                  AppStrings.cashHist,
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    height: 19.0.toFigmaHeight(16),
                    color: Pallet.primary,
                  ),
                ),
                15.0.sbH,
                Flexible(
                  child: FutureBuilder<CashbackHistoryResponse?>(
                    future: model.getHistory(),
                    builder: (context, snapshot) {
                      CashbackHistoryResponse? request = snapshot.data;
                      var history = request?.data?.cashbackHistory;
                      if (snapshot.data != null) {
                        return Container(
                          child: history?.length == 0
                              ? Container(
                                  alignment: Alignment.center,
                                  width: 200.w,
                                  height: 200.h,
                                  child: Column(
                                    children: [
                                      40.0.sbH,
                                      Container(
                                        height: 100.h,
                                        width: 100.w,
                                        padding: pad(horiz: 7, vert: 7),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          color:
                                              Pallet.primary.withOpacity(0.07),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.close,
                                            size: AppSize.s60,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      15.0.sbH,
                                      Text(
                                        'You have no history',
                                        style: getMediumStyle(
                                            fontSize: FontSize.s16,
                                            height: 18.0.toFigmaHeight(16)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: pad(),
                                  shrinkWrap: true,
                                  itemCount: history?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    CashbackHistory? newItem = history?[index];
                                    return HistoryCard(
                                      index: index,
                                      service: '${newItem?.serviceName}',
                                      cashback: '${newItem?.cashback}',
                                      time: '${newItem?.datetime}',
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(height: 0.5.h),
                                ),
                        );
                      } else {
                        return const HistoryShimmerCart();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _closeApp(BuildContext context) {
    // bool _isShown = true;
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: Pallet.white,
          actionsPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          title: Text(
            AppStrings.closeApp,
            style: getSemiBoldStyle(
                fontSize: FontSize.s18, height: 21.0.toFigmaHeight(18)),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 130.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppStrings.closeAppDetails,
                  style: getRegularStyle(
                    fontSize: FontSize.s14,
                  ),
                  textAlign: TextAlign.center,
                ),
                1.0.sbH,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Pallet.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No',
                              style: getBoldStyle(
                                color: Pallet.white,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.0.sbW,
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Pallet.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: () {
                          pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Yes',
                              style: getBoldStyle(
                                color: Pallet.white,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
