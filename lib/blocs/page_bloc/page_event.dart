part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int bottomNavBarIndex;
  final bool isExpired;

  GoToMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class GoToSignUpPage extends PageEvent {
  final RegistrationData registrationData;

  GoToSignUpPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToPreferencesPage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencesPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToMovieDetailPage extends PageEvent {
  final Movie movie;
  final bool upcoming;

  GoToMovieDetailPage({this.movie, this.upcoming = false});

  @override
  List<Object> get props => [movie, upcoming];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetail movieDetail;

  GoToSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class GoToSelectSeatPage extends PageEvent {
  final Ticket ticket;

  GoToSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToCheckoutPage extends PageEvent {
  final Ticket ticket;

  GoToCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToSuccessPage extends PageEvent {
  final Ticket ticket;
  final AppTransaction transaction;

  GoToSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class GoToTicketDetailPage extends PageEvent {
  final Ticket ticket;

  GoToTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTopUpPage extends PageEvent {
  final PageEvent pageEvent;

  GoToTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToWalletPage extends PageEvent {
  final PageEvent pageEvent;

  GoToWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToEditProfilePage extends PageEvent {
  final User user;

  GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}

class GoToBrowseMoviePage extends PageEvent {
  final String genreId;
  final String genre;

  GoToBrowseMoviePage(this.genreId, this.genre);

  @override
  List<Object> get props => [genreId, genre];
}
