import 'package:balancee_app/data/core/config.dart';
import 'package:balancee_app/data/core/network/error_handler.dart';
import 'package:balancee_app/data/core/network/urlPath.dart';
import 'package:balancee_app/data/remote/user_remote.dart';
import 'package:balancee_app/domain/models/cashback_history_response.dart';
import 'package:dio/dio.dart';

/// This calls implements the UserRemote logic
class UserRemoteImpl extends UserRemote {
  final Dio dio;

  UserRemoteImpl(
    this.dio,
  );

  @override
  Future<CashbackHistoryResponse?> getHistory() async {
    try {
      var response = await dio.get("${Config.BASEURL}${UrlPath.history}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
          }));
      final responseData = CashbackHistoryResponse.fromJson(response.data);
      return responseData;
    } on DioException catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }
}
