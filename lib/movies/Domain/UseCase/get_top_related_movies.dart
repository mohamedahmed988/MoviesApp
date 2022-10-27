import 'package:dartz/dartz.dart';
import 'package:movies_app/core/useCase/baseUseCase.dart';
import 'package:movies_app/movies/Domain/Repository/base_movies_reposetory.dart';

import '../../../core/error/failuare.dart';
import '../Entities/movie.dart';

class GetTopRelatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetTopRelatedMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters  parameters)  async{
    return await baseMovieRepository.getTopRatedMovies();


  }
}