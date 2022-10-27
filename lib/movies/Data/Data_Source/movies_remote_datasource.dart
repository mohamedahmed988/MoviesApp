
import 'package:dio/dio.dart';
import 'package:movies_app/core/Network/ErrorMassegemodel.dart';
import 'package:movies_app/core/Network/api_constance.dart';
import 'package:movies_app/core/error/excption.dart';
import 'package:movies_app/movies/Data/Model/movie_details_model.dart';
import 'package:movies_app/movies/Data/Model/movie_model.dart';
import 'package:movies_app/movies/Data/Model/recommandtion_model.dart';
import 'package:movies_app/movies/Domain/UseCase/get_recommandation_usecase.dart';
import '../../Domain/UseCase/get_movie_detail_usecase.dart';


abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>  getNowPlayingMovies();
  Future<List<MovieModel>>  getPopularMovies();
  Future<List<MovieModel>>  getTopRelatedMovies();
  Future<MovieDetailModel>  getMovieDetails(MovieDetailParameters parameters);
  Future<List<RecommendationModel>>  getRecommendation(RecommendationParameters parameters);
}



class
    MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"] as List).map((e) => MovieModel.fromJson(e),
          ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"] as List).map((e) => MovieModel.fromJson(e),
          ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<MovieModel>> getTopRelatedMovies() async {
    final response = await Dio().get(ApiConstance.topRelatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
          (response.data["results"] as List).map((e) => MovieModel.fromJson(e),
          ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<MovieDetailModel>
  getMovieDetails(MovieDetailParameters parameters) async {
    final response
    = await Dio().get(ApiConstance.movieDetailPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map((e) =>
              RecommendationModel.fromJson(e),
          ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),);
    }
  }
}