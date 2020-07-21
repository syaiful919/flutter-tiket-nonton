part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthUnauthorized extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final FirebaseUser user;

  AuthSuccess(this.user);
  @override
  List<Object> get props => [user];
}
