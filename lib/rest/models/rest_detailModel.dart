import 'package:deli/rest/models/rest_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rest_detailModel.g.dart';

@JsonSerializable()
class RestDetailModel extends RestModel {
  final String detail;
  final List<RestProductModel> products;

  RestDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

  factory RestDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestDetailModelFromJson(json);

  // factory RestDetailModel.fromJson({required Map<String, dynamic> json}) {
  //   return RestDetailModel(
  //     id: json['id'],
  //     name: json['name'],
  //     thumbUrl: json['thumbUrl'],
  //     tags: List<String>.from(json['tags']),
  //     priceRange: RestPriceRange.values.firstWhere(
  //       (el) => el.name == json['priceRange'],
  //     ),
  //     ratings: json['ratings'],
  //     ratingsCount: json['ratingsCount'],
  //     deliveryTime: json['deliveryTime'],
  //     deliveryFee: json['deliveryFee'],
  //     detail: json['detail'],
  //     products: json['products']
  //         .map<RestProductModel>(
  //           (el) => RestProductModel.fromJson(json: el),
  //         )
  //         .toList(),
  //   );
  // }
}

@JsonSerializable()
class RestProductModel {
  final String id, name, imgUrl, detail;
  final int price;

  RestProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestProductModel.fromJson(Map<String, dynamic> json) =>
      _$RestProductModelFromJson(json);

  // factory RestProductModel.fromJson({required Map<String, dynamic> json}) {
  //   return RestProductModel(
  //     id: json['id'],
  //     name: json['name'],
  //     imgUrl: json['imgUrl'],
  //     detail: json['detail'],
  //     price: json['price'],
  //   );
  // }
}
