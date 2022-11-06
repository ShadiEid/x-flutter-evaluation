import 'package:bloc_app/repositories/auth_repository.dart';

class AuthEvent {
  const AuthEvent();
}

/// when email text changed
class FormEmailChanged extends AuthEvent {
  final String email;
  const FormEmailChanged(this.email);
}

/// when password text changed
class FormPasswordChanged extends AuthEvent {
  final String password;
  const FormPasswordChanged(this.password);
}

/// When the user signing in with email and password this event is called and the [AuthRepository] is called to sign in the user
class SignInRequested extends AuthEvent {
  const SignInRequested();
}

/// When the user signing up with email and password this event is called and the [AuthRepository] is called to sign up the user
class SignUpRequested extends AuthEvent {
  const SignUpRequested();
}

/// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class SignOutRequested extends AuthEvent {
  const SignOutRequested();
}
