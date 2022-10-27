

import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/Domain/Entities/recommendtion.dart';
import 'package:movies_app/movies/Domain/UseCase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/Domain/UseCase/get_recommandation_usecase.dart';

import '../../../core/error/failuare.dart';
import '../Entities/movie.dart';
import '../Entities/movie_datail.dart';

abstract class BaseMovieRepository{


  Future<Either< Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either< Failure,List<Movie>>>getPopularMovies();
  Future<Either< Failure,List<Movie>>>getTopRatedMovies();
  Future<Either< Failure,MovieDetail>>getMovieDetails(MovieDetailParameters parameters);
  Future<Either< Failure,List<Recommendation>>>getRecommendation(
      RecommendationParameters parameters
      );


}