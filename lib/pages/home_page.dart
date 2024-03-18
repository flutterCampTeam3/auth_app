import 'package:app_github_connection/helper/colors.dart';
import 'package:app_github_connection/helper/sized.dart';
import 'package:app_github_connection/widgets/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/food_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<FoodCubit>();
    cubit.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home page",
          style: TextStyle(
            color: firstColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
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

                        Navigator.pop(context);
                       
                      }
                      if (state is ErrorMassageState) {
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
             if (state is ImageDisplayState) {
                    return ImageView(img: state.images);
             }
              else {
                return const SizedBox();
    }
  },
),

                
                gapH30,
                gapH30,
                gapH30,
                const Text(
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
