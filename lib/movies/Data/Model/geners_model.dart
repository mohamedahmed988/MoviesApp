import 'package:movies_app/movies/Domain/Entities/generes.dart';

class GeneresModel extends Genres {
  const GeneresModel({
    required super.name,
    required super.id,
  });
  factory GeneresModel.fromJson(Map<String , dynamic> json )=> GeneresModel(
      name: json["name"],
      id: json["id"]);

}