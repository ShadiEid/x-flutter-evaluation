import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/inputs/email.dart';
import '../../models/inputs/password.dart';
import '../../repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const UnAuthenticated()) {
    // when email text changed
    on<FormEmailChanged>((event, emit) {
      final email = EmailInput.dirty(event.email);
      emit(state.copyWith(email: email));
    });
    // when password text changed
    on<FormPasswordChanged>((event, emit) {
      final password = PasswordInput.dirty(event.password);
      emit(state.copyWith(password: password));
    });
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignInRequested>((event, emit) async {
      final email = state.email.value;
      final password = state.password.value;
      emit(state.loadState());
      try {
        await authRepository.signIn(email: email, password: password);
        emit(const Authenticated());
      } catch (e) {
        emit(state.errorState(e.toString()));
      }
    });
    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignUpRequested>((event, emit) async {
      final email = state.email.value;
      final password = state.password.value;
      emit(state.loadState());
      try {
        await authRepository.signUp(email: email, password: password);
        emit(const Authenticated());
      } catch (e) {
        emit(state.errorState(e.toString()));
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(state.loadState());
      await authRepository.signOut();
      emit(const UnAuthenticated());
    });
  }
}
