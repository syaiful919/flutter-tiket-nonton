part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;
  final bool isExpired;

  OnMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class OnSignUpPage extends PageState {
  final RegistrationData registrationData;

  OnSignUpPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnPreferencesPage extends PageState {
  final RegistrationData registrationData;

  OnPreferencesPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnMovieDetailPage extends PageState {
  final Movie movie;

  OnMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;

  OnSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;

  OnSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnCheckoutPage extends PageState {
  final Ticket ticket;

  OnCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnSuccessPage extends PageState {
  final Ticket ticket;
  final AppTransaction transaction;

  OnSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class OnTicketDetailPage extends PageState {
  final Ticket ticket;

  OnTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;

  OnTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class OnWalletPage extends PageState {
  final PageEvent pageEvent;

  OnWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class OnEditProfilePage extends PageState {
  final User user;

  OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}

class OnBrowseMoviePage extends PageState {
  final String genreId;
  final String genre;

  OnBrowseMoviePage(this.genreId, this.genre);

  @override
  List<Object> get props => [genreId, genre];
}
