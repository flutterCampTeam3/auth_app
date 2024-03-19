import 'package:app_github_connection/data/service/api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getData() async {
    try {
      emit(ImageLoadingState());
      String imageData = await Api().getDataFood();
      print(imageData);
      emit(ImageDisplayState(images: imageData));
    } catch (error) {
      emit(ErrorMassageState(massage: error.toString()));
    }
  }
}
