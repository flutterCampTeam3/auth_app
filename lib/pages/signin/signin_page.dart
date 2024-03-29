import 'package:app_github_connection/helper/colors.dart';
import 'package:app_github_connection/helper/extintion.dart';
import 'package:app_github_connection/pages/home%20page/home_page.dart';
import 'package:app_github_connection/pages/signin/cubit/siginin_cubit.dart';
import 'package:app_github_connection/pages/signin/widgets/reset_password.dart';
import 'package:app_github_connection/pages/signup/signup_page.dart';
import 'package:app_github_connection/widgets/elevated_button_widget.dart';
import 'package:app_github_connection/widgets/text_fiels_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController registeredController = TextEditingController();
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Mobile login-rafiki.png',
                width: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              BlocConsumer<SigininCubit, SigininState>(
                listener: (context, state) {
                  if (state is LoadingSignInState) {
                    showDialog(
                        barrierDismissible: false,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: SizedBox(
                              height: 80,
                              width: 80,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        });
                  }
                  if (state is SuccessSignInState) {
                    Navigator.pop(context);
                    context.pushTo(view: const HomePage());
                  }
                  if (state is ErrorSignInState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.massage),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      const Text("Sign in to continue"),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        label: "Email",
                        hintText: "gmail@gmail.com",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        label: "Password",
                        hintText: "*********",
                        controller: passwordController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ResetPassword(
                            controller: registeredController,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButtonWidget(
                        onPressed: () async {
                          context.read<SigininCubit>().signin(
                                password: passwordController.text,
                                email: emailController.text,
                              );
                        },
                        text: "Sign in",
                      ),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an acount?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          },
                        ));
                      },
                      child: const Text("Register")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
