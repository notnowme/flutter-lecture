import 'package:deli/common/dio/dio.dart';
import 'package:deli/common/models/cursor_pagination_model.dart';
import 'package:deli/rest/models/rest_detailModel.dart';
import 'package:deli/rest/models/rest_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';

part 'rest_repository.g.dart';

final restRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final repo = RestRepository(dio, baseUrl: 'http://10.0.2.2:3000/restaurant');
  return repo;
});

@RestApi()
abstract class RestRepository {
  factory RestRepository(Dio dio, {String baseUrl}) = _RestRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<RestModel>> paginate();

  @GET('/{id}')
  @Headers({'accessToken': 'true'})
  Future<RestDetailModel> getRestDetail({
    @Path() required String id,
  });
}
