import 'package:balancee_app/data/remote/user_remote.dart';
import 'package:balancee_app/data/repository/user_repository.dart';
import 'package:balancee_app/domain/models/cashback_history_response.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemote userRemote;
  UserRepositoryImpl(this.userRemote);

  @override
  Future<CashbackHistoryResponse?> getHistory() async {
    final response = await userRemote.getHistory();
    return response;
  }
}
