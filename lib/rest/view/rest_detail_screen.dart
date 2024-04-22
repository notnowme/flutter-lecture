import 'package:deli/common/const/data.dart';
import 'package:deli/common/dio/dio.dart';
import 'package:deli/common/layout/default_layout.dart';
import 'package:deli/product/widgets/product_card.dart';
import 'package:deli/rest/models/rest_detailModel.dart';
import 'package:deli/rest/repository/rest_repository.dart';
import 'package:deli/rest/widgets/rest_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestDetailScreen extends ConsumerWidget {
  const RestDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: FutureBuilder<RestDetailModel>(
        future: ref.watch(restRepositoryProvider).getRestDetail(id: id),
        builder: (_, AsyncSnapshot<RestDetailModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: [
              _renderTop(
                model: snapshot.data!,
              ),
              _renderLable(),
              _renderProducts(
                prouducts: snapshot.data!.products,
              ),
            ],
          );
        },
      ),
    );
  }
}

SliverToBoxAdapter _renderTop({required RestDetailModel model}) {
  return SliverToBoxAdapter(
    child: RestCard.fromModel(
      model: model,
      isDetail: true,
    ),
  );
}

SliverPadding _renderLable() {
  return const SliverPadding(
    padding: EdgeInsets.symmetric(
      horizontal: 16,
    ),
    sliver: SliverToBoxAdapter(
      child: Text(
        '메뉴',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

SliverPadding _renderProducts({
  required List<RestProductModel> prouducts,
}) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    sliver: SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final model = prouducts[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ProductCard.fromModel(
              model: model,
            ),
          );
        },
        childCount: prouducts.length,
      ),
    ),
  );
}
