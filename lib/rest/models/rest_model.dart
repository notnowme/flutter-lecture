import 'package:json_annotation/json_annotation.dart';

part 'rest_model.g.dart';

enum RestPriceRange {
  expensive,
  medium,
  cheap,
}

@JsonSerializable()
class RestModel {
  final String id, name, thumbUrl;
  final List<String> tags;
  final RestPriceRange priceRange;
  final double ratings;
  final int ratingsCount, deliveryTime, deliveryFee;

  RestModel({
    required this.id,
    required this.name,
    // @JsonKey(
    //   fromJson: pathToUrl,
    // )
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestModel.fromJson(Map<String, dynamic> json) =>
      _$RestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestModelToJson(this);

  static pathToUrl(String value) {
    return 'http://10.0.2.2:3000$value';
  }

  // factory RestModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestModel(
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
  //   );
  // }
}
