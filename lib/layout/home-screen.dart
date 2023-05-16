import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/cubit/states.dart';
import 'package:quiz_app/layout/startQuiz-screen.dart';

import '../cubit/cubit.dart';
import '../style/colors.dart';
import '../style/constant.dart';
import '../style/custom_button.dart';
import '../style/custom_text.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              txt: "Quiz App",
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          drawer: DrawerWidget(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/quiz.png"),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                colorButton: ColorsConst.primaryColor,
                txt: "Let`s Start!",
                onPressed:(){
                  cubit.addUser('rewan', 'mrr@2019.ps');
                  NormalNav(ctx: context,screen: StartQuizScreen());
                } ,
                width: 250.w, high: 60.h, outLineBorder: false,
              ),
            ],
          ),

        );
      },

    );
  }
}
