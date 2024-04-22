import 'package:deli/common/const/data.dart';
import 'package:deli/common/dio/dio.dart';
import 'package:deli/common/models/cursor_pagination_model.dart';
import 'package:deli/rest/models/rest_model.dart';
import 'package:deli/rest/provider/rest_provider.dart';
import 'package:deli/rest/repository/rest_repository.dart';
import 'package:deli/rest/view/rest_detail_screen.dart';
import 'package:deli/rest/widgets/rest_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestScreen extends ConsumerStatefulWidget {
  const RestScreen({super.key});

  @override
  ConsumerState<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends ConsumerState<RestScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: data.when(
        data: (data) {
          if (data.data.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemCount: data.data.length,
              itemBuilder: (_, index) {
                final pItem = data.data[index];

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
          }
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text('Error'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
