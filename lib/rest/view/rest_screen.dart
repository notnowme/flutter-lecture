import 'package:deli/common/const/data.dart';
import 'package:deli/common/dio/dio.dart';
import 'package:deli/rest/models/rest_model.dart';
import 'package:deli/rest/repository/rest_repository.dart';
import 'package:deli/rest/view/rest_detail_screen.dart';
import 'package:deli/rest/widgets/rest_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({super.key});

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen> {
  Future<List<RestModel>> paginateRest() async {
    final dio = Dio();

    dio.interceptors.add(
      CustomInterceptor(
        storage: storage,
      ),
    );

    final res =
        await RestRepository(dio, baseUrl: 'http://10.0.2.2:3000/restaurant')
            .paginate();

    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<RestModel>>(
            future: paginateRest(),
            builder: (context, AsyncSnapshot<List<RestModel>> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final pItem = snapshot.data![index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RestDetailScreen(
                            id: pItem.id,
                          ),
                        ),
                      );
                    },
                    child: RestCard.fromModel(
                      model: pItem,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
