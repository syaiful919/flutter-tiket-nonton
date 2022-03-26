import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiket_nonton/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckUser) {
      FirebaseUser user = await AuthServices.getFirebaseUser();

      if (user == null) {
        yield AuthUnauthorized();
      } else {
        yield AuthSuccess(user);
      }
    } else if (event is SignInAction) {
      yield AuthSuccess(event.user);
    } else if (event is SignOutAction) {
      yield AuthUnauthorized();
    }
  }
}
