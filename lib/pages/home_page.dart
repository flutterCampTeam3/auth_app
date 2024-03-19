import 'package:app_github_connection/helper/colors.dart';
import 'package:app_github_connection/helper/sized.dart';
import 'package:app_github_connection/pages/signin/cubit/siginin_cubit.dart';
import 'package:app_github_connection/pages/signin/signin_page.dart';
import 'package:app_github_connection/pages/signup/cubit/signup_cubit.dart';
import 'package:app_github_connection/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<SigininCubit>().signout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SigninPage()));
            },
            icon: const Icon(Icons.logout)),
        title: Text(
          "Home page",
          style: TextStyle(
            color: firstColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                ImageView(),
                gapH30,
                gapH30,
                gapH30,
                Text(
                  "you did it team",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
