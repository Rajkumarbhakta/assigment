part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {
  final String email;
  final String password;
  SignUpInitial({this.email = '', this.password = ''});
}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String message;
  SignUpSuccess(this.message);
}
final class SignUpFailed extends SignUpState {
  final String message;
  SignUpFailed(this.message);
}

