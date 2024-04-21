// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_detailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestDetailModel _$RestDetailModelFromJson(Map<String, dynamic> json) =>
    RestDetailModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbUrl: json['thumbUrl'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      priceRange: $enumDecode(_$RestPriceRangeEnumMap, json['priceRange']),
      ratings: (json['ratings'] as num).toDouble(),
      ratingsCount: json['ratingsCount'] as int,
      deliveryTime: json['deliveryTime'] as int,
      deliveryFee: json['deliveryFee'] as int,
      detail: json['detail'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => RestProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestDetailModelToJson(RestDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbUrl': instance.thumbUrl,
      'tags': instance.tags,
      'priceRange': _$RestPriceRangeEnumMap[instance.priceRange]!,
      'ratings': instance.ratings,
      'ratingsCount': instance.ratingsCount,
      'deliveryTime': instance.deliveryTime,
      'deliveryFee': instance.deliveryFee,
      'detail': instance.detail,
      'products': instance.products,
    };

const _$RestPriceRangeEnumMap = {
  RestPriceRange.expensive: 'expensive',
  RestPriceRange.medium: 'medium',
  RestPriceRange.cheap: 'cheap',
};

RestProductModel _$RestProductModelFromJson(Map<String, dynamic> json) =>
    RestProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      detail: json['detail'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$RestProductModelToJson(RestProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'detail': instance.detail,
      'price': instance.price,
    };
