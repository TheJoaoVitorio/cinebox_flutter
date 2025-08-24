import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tmdb_service.g.dart';

@RestApi()
abstract class TmdbService {
  factory TmdbService(Dio dio, {String baseUrl}) = _TmdbService;
}