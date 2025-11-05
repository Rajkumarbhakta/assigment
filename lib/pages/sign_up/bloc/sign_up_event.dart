part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class OnSignUpClick extends SignUpEvent{
  final String email;
  final String password;
  OnSignUpClick({required this.email,required this.password});
}

