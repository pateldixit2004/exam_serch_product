// To parse this JSON data, do
//
//     final proModel = proModelFromJson(jsonString);

import 'dart:convert';

ProModel proModelFromJson(String str) => ProModel.fromJson(json.decode(str));

String proModelToJson(ProModel data) => json.encode(data.toJson());

class ProModel {
  String? status;
  String? requestId;
  List<Datum>? data;

  ProModel({
    this.status,
    this.requestId,
    this.data,
  });

  factory ProModel.fromJson(Map<String, dynamic> json) => ProModel(
    status: json["status"],
    requestId: json["request_id"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "request_id": requestId,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? storeName;
  double? storeRating;
  String? offerPageUrl;
  int? storeReviewCount;
  String? storeReviewsPageUrl;
  String? price;
  String? shipping;
  String? tax;
  bool? onSale;
  dynamic originalPrice;
  ProductCondition? productCondition;

  Datum({
    this.storeName,
    this.storeRating,
    this.offerPageUrl,
    this.storeReviewCount,
    this.storeReviewsPageUrl,
    this.price,
    this.shipping,
    this.tax,
    this.onSale,
    this.originalPrice,
    this.productCondition,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    storeName: json["store_name"],
    storeRating: json["store_rating"]?.toDouble(),
    offerPageUrl: json["offer_page_url"],
    storeReviewCount: json["store_review_count"],
    storeReviewsPageUrl: json["store_reviews_page_url"],
    price: json["price"],
    shipping: json["shipping"],
    tax: json["tax"],
    onSale: json["on_sale"],
    originalPrice: json["original_price"],
    productCondition: productConditionValues.map[json["product_condition"]]!,
  );

  Map<String, dynamic> toJson() => {
    "store_name": storeName,
    "store_rating": storeRating,
    "offer_page_url": offerPageUrl,
    "store_review_count": storeReviewCount,
    "store_reviews_page_url": storeReviewsPageUrl,
    "price": price,
    "shipping": shipping,
    "tax": tax,
    "on_sale": onSale,
    "original_price": originalPrice,
    "product_condition": productConditionValues.reverse[productCondition],
  };
}

enum ProductCondition { NEW, USED }

final productConditionValues = EnumValues({
  "NEW": ProductCondition.NEW,
  "USED": ProductCondition.USED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
