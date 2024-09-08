class CashbackHistoryResponse {
  String? status;
  String? message;
  Data? data;

  CashbackHistoryResponse({this.status, this.message, this.data});

  CashbackHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CashbackHistory>? cashbackHistory;

  Data({this.cashbackHistory});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cashback_history'] != null) {
      cashbackHistory = <CashbackHistory>[];
      json['cashback_history'].forEach((v) {
        cashbackHistory!.add(new CashbackHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cashbackHistory != null) {
      data['cashback_history'] =
          this.cashbackHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CashbackHistory {
  String? serviceName;
  String? bookingId;
  String? datetime;
  int? price;
  int? cashback;

  CashbackHistory(
      {this.serviceName,
      this.bookingId,
      this.datetime,
      this.price,
      this.cashback});

  CashbackHistory.fromJson(Map<String, dynamic> json) {
    serviceName = json['service_name'];
    bookingId = json['booking_id'];
    datetime = json['datetime'];
    price = json['price'];
    cashback = json['cashback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_name'] = this.serviceName;
    data['booking_id'] = this.bookingId;
    data['datetime'] = this.datetime;
    data['price'] = this.price;
    data['cashback'] = this.cashback;
    return data;
  }
}
