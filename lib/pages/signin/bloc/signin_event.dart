part of 'signin_bloc.dart';

@immutable
sealed class SignInEvent {}


class AddSignInEvent extends SignInEvent {
  final String email;
  final String password;
  AddSignInEvent({required this.email, required this.password});
}

