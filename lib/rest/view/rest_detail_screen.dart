import 'package:deli/common/const/data.dart';
import 'package:deli/common/dio/dio.dart';
import 'package:deli/common/layout/default_layout.dart';
import 'package:deli/product/widgets/product_card.dart';
import 'package:deli/rest/models/rest_detailModel.dart';
import 'package:deli/rest/repository/rest_repository.dart';
import 'package:deli/rest/widgets/rest_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestDetailScreen extends StatelessWidget {
  const RestDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  Future<RestDetailModel> getRestDetail() async {
    final dio = Dio();

    dio.interceptors.add(
      CustomInterceptor(storage: storage),
    );

    final repository =
        RestRepository(dio, baseUrl: 'http://10.0.2.2:3000/restaurant');

    return repository.getRestDetail(id: id);
    // final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    // final res = await dio.get(
    //   'http://10.0.2.2:3000/restaurant/$id',
    //   options: Options(
    //     headers: {
    //       'authorization': 'Bearer $accessToken',
    //     },
    //   ),
    // );

    // return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: FutureBuilder<RestDetailModel>(
        future: getRestDetail(),
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
