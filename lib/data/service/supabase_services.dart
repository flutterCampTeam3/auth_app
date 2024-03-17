import 'package:app_github_connection/data/data_layer.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;
  final locator = GetIt.I.get<AllData>();

  Future signUp({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    await supabase.auth.signUp(email: email, password: password!);
  }

  Future signIn({
    required String? email,
    required String? password,
  }) async {
    await supabase.auth.signInWithPassword(email: email, password: password!);
    locator.token = supabase.auth.currentSession!.accessToken;
    locator.addToken();
  }

  Future signout() async {
    await supabase.auth.signOut();
  }
}
