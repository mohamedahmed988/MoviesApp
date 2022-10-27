import 'package:movies_app/movies/Domain/Entities/recommendtion.dart';

class RecommendationModel extends Recommendation{
  const RecommendationModel({
     super.backdropPath,
    required super.id,

});

  factory RecommendationModel.fromJson(Map<String ,dynamic >json)=>
      RecommendationModel(
          backdropPath: json["backdrop_path"] ?? '',
          id: json["id"]);
}