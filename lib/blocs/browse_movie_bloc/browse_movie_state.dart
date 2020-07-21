part of 'browse_movie_bloc.dart';

abstract class BrowseMovieState extends Equatable {
  const BrowseMovieState();
}

class BrowseMovieInitial extends BrowseMovieState {
  @override
  List<Object> get props => [];
}

class BrowseMovieLoaded extends BrowseMovieState {
  final List<Movie> movies;

  BrowseMovieLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}
