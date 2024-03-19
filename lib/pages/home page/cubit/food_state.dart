part of 'food_cubit.dart';

@immutable
sealed class FoodState {}

final class FoodInitial extends FoodState {}

class ImageLoadingState extends FoodState {}

class ImageDisplayState extends FoodState {
  final String images;
  ImageDisplayState({required this.images});
}

class ErrorMassageState extends FoodState {
  final String massage;
  ErrorMassageState({required this.massage});
}
