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
  @override
  List<Object> get props => [];
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
