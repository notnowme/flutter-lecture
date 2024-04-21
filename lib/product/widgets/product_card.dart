import 'package:deli/common/const/colors.dart';
import 'package:deli/rest/models/rest_detailModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
  });

  final Image image;
  final String name;
  final String detail;
  final int price;

  factory ProductCard.fromModel({
    required RestProductModel model,
  }) {
    return ProductCard(
      image: Image.network(
        'http://10.0.2.2:3000${model.imgUrl}',
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      name: model.name,
      detail: model.detail,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  detail,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '\$ $price',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
