import 'package:app_github_connection/database_auth/auth.dart';
import 'package:app_github_connection/pages/signin/signin_page.dart';
import 'package:app_github_connection/widgets/elevated_button_widget.dart';
import 'package:app_github_connection/widgets/text_fiels_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_github_connection/helper/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                'assets/Sign up-rafiki.png',
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Let's Get Started",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
              const Text("Create a new account"),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: "Name",
                hintText: "Name",
                controller: firstNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                label: "Phone",
                hintText: "05*******",
                controller: secondNameController,
              ),
              const SizedBox(
                height: 15,
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
              const SizedBox(
                height: 20,
              ),
             MaterialButton(
                color: Colors.red.shade200,
                onPressed: () async {
                  //--- SignUp Button

                  try {
                    await DBService().SignUp(
                        email: emailController.text,
                        password: passwordController.text);
                  } on AuthException catch (e) {
                    print("email or password rung");
                  }
                },
                child: const Text("SignUp"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninPage(),
                          ),
                        );
                      },
                      child: const Text("Sign in")),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
