part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckUser extends AuthEvent {
  @override
  List<Object> get props => [];
}

class SignInAction extends AuthEvent {
  final FirebaseUser user;

  SignInAction(this.user);

  @override
  List<Object> get props => [user];
}

class SignOutAction extends AuthEvent {
  @override
  List<Object> get props => [];
}
