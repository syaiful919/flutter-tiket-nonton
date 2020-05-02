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
  @override
  List<Object> get props => [];
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
