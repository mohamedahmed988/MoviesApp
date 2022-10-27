


import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/Utils/enums.dart';
import 'package:movies_app/movies/Domain/Entities/movie_datail.dart';
import 'package:movies_app/movies/Domain/Entities/recommendtion.dart';
import 'package:movies_app/movies/Domain/UseCase/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/Domain/UseCase/get_recommandation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase ,this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailUseCase(
        MovieDetailParameters(movieId: event.id));
    result.fold((l) =>
        emit(state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        )),


            (r) =>
            emit(
                state.copyWith(
                  movieDetail: r,
                  movieDetailsState: RequestState.loaded,
                )
            ));
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(
        RecommendationParameters(event.id));
    result.fold((l) =>
        emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        )),


            (r) =>
            emit(
                state.copyWith(
                  recommendation: r,
                  recommendationState: RequestState.loaded,
                )
            ));
  }
}
