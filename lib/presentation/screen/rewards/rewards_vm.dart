import 'dart:math';

import 'package:balancee_app/domain/models/cashback_history_response.dart';
import 'package:balancee_app/presentation/base/base.vm.dart';
import 'package:balancee_app/utils/alert_message.dart';
import 'package:balancee_app/utils/app_strings.dart';
import 'package:balancee_app/utils/constants.dart';
import 'package:balancee_app/utils/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RewardsViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  double totalCashback = 34560.00;
  double _balance = 10770.00;
  String service = 'Engine Overhaul';
  String fee = '150.00';
  String time = '2024-09-07T12:45:00Z';
  TextEditingController amount = TextEditingController();
  String _selectedOption = "Bank Account";

  String get selectedOption => _selectedOption;
  double get balance => _balance;

  void changeSelectedOption(String newOption) {
    _selectedOption = newOption;
    notifyListeners();
  }

  void updateBalance(double balance) {
    _balance = balance;
    notifyListeners();
  }

  void withdrawDirect(
      BuildContext context, double amountToWithdraw, double currentBalance) {
    if (amountToWithdraw > 0 && amountToWithdraw <= currentBalance) {
      currentBalance -= amountToWithdraw;
      String feedback;
      if (selectedOption == AppStrings.bankAcc) {
        feedback =
            "Cashout Successful! ₦${NumberFormat("#,##0.00", "en_US").format(double.parse(amount.text.trim()))} withdrawn to bank account.";
      } else {
        feedback =
            "Cashout Successful! Discount of ₦${NumberFormat("#,##0.00", "en_US").format(double.parse(amount.text.trim()))} on your next service.";
      }
      Navigator.pop(context, currentBalance);
      amount.clear();
      showCustomToast(feedback, success: true);
    } else {
      showCustomToast("Your balance is less than requested amount");
    }
  }

  String generateRandomString() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    final random = Random();

    // Generate 3 random uppercase letters
    String randomLetters =
        List.generate(3, (_) => letters[random.nextInt(letters.length)]).join();

    // Generate 2 random numbers
    String randomNumbers =
        List.generate(2, (_) => numbers[random.nextInt(numbers.length)]).join();

    // Combine and shuffle
    String combined = randomLetters + randomNumbers;
    List<String> shuffled = combined.split('')..shuffle();

    // Return the final shuffled string
    return shuffled.join();
  }

  void convertToPromoCode(
      BuildContext context, double amountToWithdraw, double currentBalance) {
    if (amountToWithdraw > 0 && amountToWithdraw <= currentBalance) {
      currentBalance -= amountToWithdraw;
      String promoCode = generateRandomString();
      Navigator.pop(context, currentBalance);
      amount.clear();
      showAlertDialog(context,
          code: promoCode, onTap: () => navigationService.goBack());
    } else {
      showCustomToast("Your balance is less than requested amount");
    }
  }

  Future<CashbackHistoryResponse?> getHistory() async {
    CashbackHistoryResponse? getHistoryResponse =
        await userRepository.getHistory();
    return getHistoryResponse;
  }
}
