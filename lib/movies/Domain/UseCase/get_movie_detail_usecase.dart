import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failuare.dart';
import 'package:movies_app/core/useCase/baseUseCase.dart';
import 'package:movies_app/movies/Domain/Entities/movie_datail.dart';
import 'package:movies_app/movies/Domain/Repository/base_movies_reposetory.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail , MovieDetailParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call( MovieDetailParameters parameters) async {

    return await baseMovieRepository.getMovieDetails(parameters);
  }


}
class MovieDetailParameters extends Equatable {

  final int movieId;
  const MovieDetailParameters({required this.movieId});

  @override

  List<Object?> get props => [movieId];

}