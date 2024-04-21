import 'package:deli/common/const/colors.dart';
import 'package:deli/rest/models/rest_detailModel.dart';
import 'package:deli/rest/models/rest_model.dart';
import 'package:flutter/material.dart';

class RestCard extends StatelessWidget {
  const RestCard({
    super.key,
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,
    this.isDetail = false,
    this.detail,
  });

  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;
  final bool isDetail;
  final String? detail;

  factory RestCard.fromModel({
    required RestModel model,
    bool isDetail = false,
  }) {
    return RestCard(
      image: Image.network(
        'http://10.0.2.2:3000${model.thumbUrl}',
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
      isDetail: isDetail,
      detail: model is RestDetailModel ? model.detail : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) image,
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: image,
          ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                tags.join(
                  ' / ',
                ),
                style: const TextStyle(
                  color: BODY_TEXT_COLOR,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star,
                    label: ratings.toString(),
                  ),
                  _rendorDot(),
                  _IconText(
                    icon: Icons.receipt,
                    label: ratingsCount.toString(),
                  ),
                  _rendorDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '$deliveryTime분',
                  ),
                  _rendorDot(),
                  _IconText(
                    icon: Icons.monetization_on,
                    label: deliveryFee == 0 ? '무료' : deliveryFee.toString(),
                  ),
                ],
              ),
              if (detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Text(detail!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _rendorDot() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 4),
    child: Text(
      '/',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class _IconText extends StatelessWidget {
  const _IconText({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
