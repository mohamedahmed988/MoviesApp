
import 'package:equatable/equatable.dart';
import '../../../core/Utils/enums.dart';
import '../../Domain/Entities/movie.dart';

class MoviesState extends Equatable{

  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState= RequestState.loading,
    this.nowPlayingMessage= '',
    this.popularMovies = const [],
    this.popularState= RequestState.loading,
    this.popularMessage= '',
    this.topRatedMovies = const [],
    this.topRatedState= RequestState.loading,
    this.topRatedMessage= '',
  });

  MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<Movie>? popularMovies,
     RequestState? popularState,
     String? popularMessage,
     List<Movie>? topRatedMovies,
     RequestState? topRatedState,
     String? topRatedMessage,
   }) {


    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage?? this.nowPlayingMessage,
      popularMovies: popularMovies??this.popularMovies,
      popularMessage: popularMessage??this.popularMessage,
      popularState: popularState??this.popularState,
      topRatedMovies: topRatedMovies??this.topRatedMovies,
      topRatedMessage: topRatedMessage??this.topRatedMessage,
      topRatedState: topRatedState??this.popularState,
    );
  }



  @override

  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularState,
    popularMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,

  ];

}