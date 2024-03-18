import 'package:app_github_connection/data/service/supabase_configration.dart';
import 'package:app_github_connection/pages/home_page.dart';
import 'package:app_github_connection/pages/signin/cubit/siginin_cubit.dart';
import 'package:app_github_connection/pages/signup/cubit/signup_cubit.dart';
import 'package:app_github_connection/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseConfig();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => SigininCubit(),
      ),
      BlocProvider(
        create: (context) => SignupCubit(),
      ),
    ], child: const MaterialApp(home: SignUpPage()));
  }
}
