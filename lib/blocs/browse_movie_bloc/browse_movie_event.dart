part of 'browse_movie_bloc.dart';

abstract class BrowseMovieEvent extends Equatable {
  const BrowseMovieEvent();
}

class FetchMovieByGenre extends BrowseMovieEvent {
  final String id;

  FetchMovieByGenre(this.id);
  @override
  List<Object> get props => [id];
}
