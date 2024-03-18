part of 'siginin_cubit.dart';

@immutable
sealed class SigininState {}

final class SigininInitial extends SigininState {}

final class LoadingState extends SigininState {}

final class SuccessState extends SigininState {}

final class ErrorState extends SigininState {
  final String massage;
  ErrorState({required this.massage});
}
