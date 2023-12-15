import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<ResetErrorMessage>((event, emit) {
      emit(state.copyWith(errorMessage: null));
    });
    on<LoginRequested>((event, emit) async {
      emit(state.copyWith(status: LoginStatus.loading));
      try {
        await _authenticationRepository.logInWithEmailAndPassword(
            email: state.email, password: state.password);
        emit(state.copyWith(status: LoginStatus.success));
      } on LogInWithEmailAndPasswordFailure catch (e) {
        emit(state.copyWith(
            status: LoginStatus.failure, errorMessage: e.message));
      } catch (e) {
        emit(state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Произошла ошибка',
        ));
      }
    });
  }

  final AuthenticationRepository _authenticationRepository;
}
