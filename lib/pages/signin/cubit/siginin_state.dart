part of 'siginin_cubit.dart';

@immutable
sealed class SigininState {}

final class SigininInitial extends SigininState {}

final class LoadingSignInState extends SigininState {}

final class SuccessSignInState extends SigininState {}

final class ErrorSignInState extends SigininState {
  final String massage;
  ErrorSignInState({required this.massage});
}
