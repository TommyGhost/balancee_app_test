import 'package:balancee_app/domain/models/cashback_history_response.dart';

abstract class UserRemote {
  Future<CashbackHistoryResponse?> getHistory();
}
