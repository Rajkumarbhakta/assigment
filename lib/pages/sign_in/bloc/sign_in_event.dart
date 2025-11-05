part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class OnSingInClicked extends SignInEvent {
  final String email;
  final String password;

  OnSingInClicked({required this.email, required this.password});
}
