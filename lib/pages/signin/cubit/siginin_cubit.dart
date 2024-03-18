import 'dart:async';

import 'package:app_github_connection/data/service/database_auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'siginin_state.dart';

class SigininCubit extends Cubit<SigininState> {
  SigininCubit() : super(SigininInitial());

  FutureOr signin({required String email, required String password}) async {
    try {
      emit(LoadingState());
      await DBService().SignIn(email: email, password: password);
      emit(SuccessState());
    } on AuthException catch (error) {
      emit(ErrorState(massage: error.message));
    }
  }

  Future signout() async {
    try {
      await DBService().SignOut();
    } catch (error) {
      print(error);
    }
  }
}
