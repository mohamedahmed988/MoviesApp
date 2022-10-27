import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/excption.dart';
import 'package:movies_app/core/error/failuare.dart';
import 'package:movies_app/movies/Domain/Entities/movie.dart';
import 'package:movies_app/movies/Domain/Entities/movie_datail.dart';
import 'package:movies_app/movies/Domain/Entities/recommendtion.dart';
import 'package:movies_app/movies/Domain/UseCase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/Domain/UseCase/get_recommandation_usecase.dart';


import '../../Domain/Repository/base_movies_reposetory.dart';
import '../Data_Source/movies_remote_datasource.dart';

class MoviesRepository extends BaseMovieRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);





  @override
  Future<Either< Failure,List<Movie>>> getNowPlayingMovies() async{
    
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
  try{
    return Right(result);
  }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }


  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRelatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getRecommendation( parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  }


