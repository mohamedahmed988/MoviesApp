
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/Data/Data_Source/movies_remote_datasource.dart';
import 'package:movies_app/movies/Data/Repository/movies_repository.dart';
import 'package:movies_app/movies/Domain/Repository/base_movies_reposetory.dart';
import 'package:movies_app/movies/Domain/UseCase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/Domain/UseCase/get_now_playing_movies.dart';
import 'package:movies_app/movies/Domain/UseCase/get_popular_movies.dart';
import 'package:movies_app/movies/Domain/UseCase/get_recommandation_usecase.dart';
import 'package:movies_app/movies/Domain/UseCase/get_top_related_movies.dart';
import 'package:movies_app/movies/Presentation/Controller/movie_details_bloc.dart';
import 'package:movies_app/movies/Presentation/Controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init(){
    /// Bloc

    sl.registerFactory(() => MoviesBloc(sl() , sl() ,sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl() , sl()));

    /// Use Case

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRelatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(
            () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
            () => MovieRemoteDataSource());
  

  }
}