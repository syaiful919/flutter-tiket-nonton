import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiket_nonton/models/models.dart';
import 'package:tiket_nonton/services/services.dart';

part 'browse_movie_event.dart';
part 'browse_movie_state.dart';

class BrowseMovieBloc extends Bloc<BrowseMovieEvent, BrowseMovieState> {
  @override
  BrowseMovieState get initialState => BrowseMovieInitial();

  @override
  Stream<BrowseMovieState> mapEventToState(
    BrowseMovieEvent event,
  ) async* {
    if (event is FetchMovieByGenre) {
      List<Movie> movies = await MovieServices.getMoviesByGenre(1, event.id);
      yield BrowseMovieLoaded(movies);
    }
  }
}
