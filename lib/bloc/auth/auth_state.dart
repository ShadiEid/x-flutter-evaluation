import '../../models/inputs/email.dart';
import '../../models/inputs/password.dart';

class AuthState {
  final bool loading;
  final EmailInput email;
  final PasswordInput password;
  final String? error;

  const AuthState({
    this.loading = false,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.error,
  });

  AuthState copyWith({
    EmailInput? email,
    PasswordInput? password,
    bool? loading,
    String? error,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  AuthState loadState() {
    return AuthState(email: email, password: password, loading: true, error: null);
  }

  AuthState errorState(String? error) {
    return AuthState(email: email, password: password, loading: false, error: error);
  }
}

// When the user is authenticated.
class Authenticated extends AuthState {
  const Authenticated();
}

// This is the initial state of the bloc.
class UnAuthenticated extends AuthState {
  const UnAuthenticated();
}
