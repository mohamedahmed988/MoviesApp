import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failuare.dart';
import 'package:movies_app/core/useCase/baseUseCase.dart';
import 'package:movies_app/movies/Domain/Entities/recommendtion.dart';
import 'package:movies_app/movies/Domain/Repository/base_movies_reposetory.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
     return await baseMovieRepository.getRecommendation(parameters);

    
  }

}

class RecommendationParameters  extends Equatable{
  final int id;
  const RecommendationParameters(this.id);

  @override
  
  List<Object?> get props => [id];
}