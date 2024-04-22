import 'dart:async';

import 'package:deli/common/models/cursor_pagination_model.dart';
import 'package:deli/rest/models/rest_model.dart';
import 'package:deli/rest/repository/rest_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestNotifier extends AsyncNotifier<CursorPagination<RestModel>> {
  late final RestRepository repo;

  @override
  FutureOr<CursorPagination<RestModel>> build() async {
    repo = ref.watch(restRepositoryProvider);
    return await paginate();
  }

  paginate() async {
    return repo.paginate();
  }
}

final restNotifierProvider =
    AsyncNotifierProvider<RestNotifier, CursorPagination<RestModel>>(() {
  return RestNotifier();
});
