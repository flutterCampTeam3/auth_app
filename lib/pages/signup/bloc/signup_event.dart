part of 'signup_bloc.dart';

@immutable
sealed class SignUpEvent {}

class CreateAccountEvent extends SignUpEvent {
  final String email;
  final String name;
  final String password;
  CreateAccountEvent({required this.email, required this.name, required this.password});
}
