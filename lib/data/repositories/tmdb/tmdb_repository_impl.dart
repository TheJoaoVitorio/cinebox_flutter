import 'dart:developer';

import 'package:cinebox_app_flutter/core/result/result.dart';
import 'package:cinebox_app_flutter/data/mappers/movie_mappers.dart';
import 'package:cinebox_app_flutter/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox_app_flutter/domain/models/movie.dart';
import 'package:dio/dio.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {

  final TmdbService _tmdbService;

  TmdbRepositoryImpl({
    required TmdbService tmdbService,
  }) : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({String language = 'pt-BR', int page = 1}) async {
    
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    }on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes populares',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Erro ao buscar filmes populares'));
    }

  }
  
  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({String language = 'pt-BR', int page = 1}) async {
    
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes recentes',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Erro ao buscar filmes recentes'));
    }

  }
  
  @override
  Future<Result<List<Movie>>> getTopRatedMovies({String language = 'pt-BR', int page = 1}) async {
    
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    }on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes mais votados',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Erro ao buscar filmes mais votados'));
    }

  }
  
  @override
  Future<Result<List<Movie>>> getUpComingMovies({String language = 'pt-BR', int page = 1}) async {
    
    try {
      final moviesData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    }on DioException catch (e, s) {
      log(
        'Erro ao buscar filmes ',
        name: 'TmdbRepository',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Erro ao buscar filmes mais votados'));
    }

  }


}