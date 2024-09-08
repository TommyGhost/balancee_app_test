import 'package:balancee_app/utils/__utils.dart';
import 'package:balancee_app/widgets/inkwell.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Card extends StatelessWidget {
  const Card(
      {super.key,
      required this.color,
      required this.padding,
      required this.child});

  final Color color;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: padding,
      child: child,
    );
  }
}

class RewardCard extends StatelessWidget {
  const RewardCard(
      {super.key, required this.totalCashback, required this.balance});

  final double totalCashback;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallet.primary,
      padding: pad(vert: 15, horiz: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.totCashEarned,
                  style: getBoldStyle(
                    fontSize: FontSize.s18,
                    height: 21.0.toFigmaHeight(18),
                    color: Pallet.white,
                  ),
                ),
                8.0.sbH,
                Text(
                  '₦${NumberFormat("#,##0.00", "en_US").format(totalCashback)}',
                  style: getSemiBoldStyle(
                    fontSize: FontSize.s18,
                    height: 21.0.toFigmaHeight(18),
                    color: Pallet.white,
                  ),
                ),
              ],
            ),
          ),
          31.0.sbH,
          Text(
            '${AppStrings.currBal}₦${NumberFormat("#,##0.00", "en_US").format(balance)}',
            style: getSemiBoldStyle(
              fontSize: FontSize.s16,
              height: 19.0.toFigmaHeight(16),
              color: Pallet.white,
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsCard extends StatelessWidget {
  const OptionsCard(
      {super.key, required this.onTapUp, required this.onTapDown});

  final Function() onTapUp;
  final Function() onTapDown;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallet.primaryLight,
      padding: pad(vert: 16, horiz: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BalanceeInkWell(
            onTap: onTapUp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.credit_card_outlined,
                        size: AppSize.s16,
                        color: Pallet.black,
                      ),
                      11.0.sbW,
                      Text(
                        '${AppStrings.direct} ${AppStrings.cashout}',
                        style: getRegularStyle(
                          fontSize: FontSize.s14,
                          height: 18.0.toFigmaHeight(14),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: AppSize.s14,
                  color: Pallet.grey,
                ),
              ],
            ),
          ),
          13.0.sbH,
          BalanceeInkWell(
            onTap: onTapDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.card_giftcard_outlined,
                        size: AppSize.s16,
                        color: Pallet.black,
                      ),
                      11.0.sbW,
                      Text(
                        AppStrings.conv2PrCode,
                        style: getRegularStyle(
                          fontSize: FontSize.s14,
                          height: 18.0.toFigmaHeight(14),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: AppSize.s14,
                  color: Pallet.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      required this.index,
      required this.service,
      required this.cashback,
      required this.time});

  final int index;
  final String service;
  final String cashback;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: padOnly(down: 16.0, top: index == 0 ? 0 : 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service,
                style: getMediumStyle(
                  fontSize: FontSize.s14,
                  height: 16.0.toFigmaHeight(14),
                ),
              ),
              Text(
                '+${double.parse(cashback).toStringAsFixed(2)}',
                style: getMediumStyle(
                  fontSize: FontSize.s14,
                  height: 16.0.toFigmaHeight(14),
                ),
              ),
            ],
          ),
          9.0.sbH,
          Text(
            DateTime.now().format('Y-m-d') ==
                    DateTime.parse(time).format('Y-m-d')
                ? 'Today, ${DateTime.parse(time).format('h:ia')}'
                : DateTime.parse(time).format('D, M j, h:ia'),
            style: getRegularStyle(
                fontSize: FontSize.s13,
                height: 15.0.toFigmaHeight(13),
                color: Pallet.grey),
          ),
        ],
      ),
    );
  }
}
