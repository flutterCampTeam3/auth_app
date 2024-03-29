import 'package:app_github_connection/helper/colors.dart';
import 'package:app_github_connection/pages/signin/cubit/siginin_cubit.dart';
import 'package:app_github_connection/pages/signin/signin_page.dart';
import 'package:app_github_connection/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/food_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FoodCubit>();
    cubit.getData();
    reGetImage() async {
      await Future.delayed(const Duration(seconds: 5));
      cubit.getData();
    }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocConsumer<FoodCubit, FoodState>(
            listener: (context, state) {
              if (state is ImageLoadingState) {
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
              if (state is ImageDisplayState) {
                // Navigator.pop(context);
                // reGetImage();
              }
              if (state is ErrorMassageState) {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.massage),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ImageDisplayState) {
                return Center(child: ImageView(img: state.images));
                // return Image.network(state.images);
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
