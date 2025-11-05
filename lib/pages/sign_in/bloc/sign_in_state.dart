part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final String message;
  SignInSuccess(this.message);
}
final class SignInFailed extends SignInState {
  final String message;
  SignInFailed(this.message);
}
