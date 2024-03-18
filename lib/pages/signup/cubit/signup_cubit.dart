import 'dart:async';

import 'package:app_github_connection/data/service/database_auth/auth.dart';
import 'package:app_github_connection/pages/signup/bloc/signup_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SupabaseClient supabase = Supabase.instance.client;

  SignupCubit() : super(SignupInitial());

  Future createAccountCubit({required String email, required String password}) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      await DBService().SignUp(email: email, password: password);
      emit(SuccessState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}
