import 'package:flutter/material.dart';
import 'package:quiz_app/layout/home-screen.dart';
import 'package:quiz_app/style/constant.dart';

import '../style/colors.dart';
import '../style/custom_button.dart';
import '../style/custom_text.dart';


class ResultQuizScreen extends StatelessWidget {
  final int result, length;

  const ResultQuizScreen({
    Key? key,
    required this.result,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            txt: result > length / 2 ? "Congratulation" : "Oops!",
            color: ColorsConst.primaryColor,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
          const SizedBox(height: 12),
          Image.asset(
            result > length / 2
                ? "assets/images/result.jpg"
                : "assets/images/fail.png",
          ),
          const SizedBox(height: 12),
          CustomText(
            txt: "Your score : ${result.toString()} / ${length.toString()}",
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.green,
          ),
          const SizedBox(height: 12),
          CustomText(
            txt: result > length / 2
                ? "Keep up the good work!"
                : "Sorry , better luck next time!",
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: (){
            NormalNav(ctx: context,screen: HomeScreen())  ;
            },
            width: 300,
            txt: "Back to home", high: 80, outLineBorder: false,
          )
        ],
      ),
    );
  }
}
