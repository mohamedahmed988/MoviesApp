import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/Utils/enums.dart';
import 'package:movies_app/movies/Domain/UseCase/get_now_playing_movies.dart';
import 'package:movies_app/movies/Presentation/Controller/movies_events.dart';
import 'package:movies_app/movies/Presentation/Controller/movies_states.dart';

import '../../../core/useCase/baseUseCase.dart';
import '../../Domain/UseCase/get_popular_movies.dart';
import '../../Domain/UseCase/get_top_related_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent , MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase    getPopularMoviesUseCase;
  final GetTopRelatedMoviesUseCase getTopRelatedMoviesUseCase;


  MoviesBloc(this.getNowPlayingMoviesUseCase ,
      this.getPopularMoviesUseCase,
      this.getTopRelatedMoviesUseCase) :
        super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase( const NoParameters());

      result.fold((l) =>
          emit(state.copyWith(nowPlayingState: RequestState.error, nowPlayingMessage: l.message,
          )),
              (r) =>
              emit(
                  state.copyWith(
                    nowPlayingMovies: r,
                    nowPlayingState: RequestState.loaded,
                  )
              )
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());

      result.fold((l) =>
          emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          )),
              (r) =>
              emit(
                  state.copyWith(
                    popularMovies: r,
                    popularState: RequestState.loaded,
                  )
              )
      );
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRelatedMoviesUseCase(const NoParameters());

      result.fold((l) =>
          emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          )),
              (r) =>
              emit(
                  state.copyWith(
                    topRatedMovies: r,
                    topRatedState: RequestState.loaded,
                  )
              )
      );
    });
    
  }
}