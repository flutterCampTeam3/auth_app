import 'package:app_github_connection/database_auth/auth.dart';
import 'package:app_github_connection/helper/colors.dart';
import 'package:app_github_connection/pages/home_page.dart';
import 'package:app_github_connection/pages/signup/signup_page.dart';
import 'package:app_github_connection/widgets/elevated_button_widget.dart';
import 'package:app_github_connection/widgets/text_fiels_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController registeredController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                            color: black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                          "We just need your Registered Email to send you password reset instruction"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFieldWidget(
                                        label: "Registered Email",
                                        hintText: "Registered Email",
                                        controller: registeredController,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Reset Password",
                                            style: TextStyle(color: white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: const Text("Forgot Password?")),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButtonWidget(
                onPressed: () async {
                try {
                  await DBService().SignIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ), (route) => false);
                } on AuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
                text: "Sign in",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an acount?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUpPage();
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
