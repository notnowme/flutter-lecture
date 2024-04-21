// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestModel _$RestModelFromJson(Map<String, dynamic> json) => RestModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbUrl: json['thumbUrl'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      priceRange: $enumDecode(_$RestPriceRangeEnumMap, json['priceRange']),
      ratings: (json['ratings'] as num).toDouble(),
      ratingsCount: json['ratingsCount'] as int,
      deliveryTime: json['deliveryTime'] as int,
      deliveryFee: json['deliveryFee'] as int,
    );

Map<String, dynamic> _$RestModelToJson(RestModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbUrl': instance.thumbUrl,
      'tags': instance.tags,
      'priceRange': _$RestPriceRangeEnumMap[instance.priceRange]!,
      'ratings': instance.ratings,
      'ratingsCount': instance.ratingsCount,
      'deliveryTime': instance.deliveryTime,
      'deliveryFee': instance.deliveryFee,
    };

const _$RestPriceRangeEnumMap = {
  RestPriceRange.expensive: 'expensive',
  RestPriceRange.medium: 'medium',
  RestPriceRange.cheap: 'cheap',
};
