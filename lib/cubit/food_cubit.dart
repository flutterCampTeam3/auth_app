import 'package:app_github_connection/pages/signup/bloc/signup_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/services/api.dart';



part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getData()async{
   try{
    emit(ImageLoadingState());
    print("tttt");
    String  imagedata =await Api().getDataFood();
    emit(ImageDisplayState(images:imagedata ));
    
   }on AuthException catch (error) {
        emit(ErrorMassageState(massage: error.message));
      }
  }
}
