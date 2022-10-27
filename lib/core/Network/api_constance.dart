class ApiConstance{
  static const String baseUrl= "https://api.themoviedb.org/3";
  static const String apiKey= "9b3129932baf749775aedcd696963300";

  static const String nowPlayingMoviePath=
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String topRelatedMoviesPath=
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String popularMoviesPath=
      "$baseUrl/movie/popular?api_key=$apiKey";

  static String movieDetailPath(int movieId)=>
       "$baseUrl/movie/$movieId?api_key=$apiKey";
static String recommendationPath(int movieId)=>
       "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const  String baseImageUrl= 'https://image.tmdb.org/t/p/w500/';
  static String imageUrl(String path) =>'$baseImageUrl$path';
}