import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/cubit/cubit.dart';
import 'package:quiz_app/layout/startQuiz-screen.dart';


import '../style/colors.dart';
import '../style/constant.dart';
import '../style/custom_text.dart';
import 'createQuiz-screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ColorsConst.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  child: Image.asset("assets/images/user.png"),
                ),
                SizedBox(
                  height: 15.h,
                  width: double.infinity,
                ),
                 CustomText(
                  txt: "Rewan-Razan",
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5.h,
                ),
                 CustomText(
                  txt: "user2019@ex.com",
                   fontSize: 12.sp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.create),
            title:  CustomText(
              txt: "Create quiz",
            ),
            onTap: () {
              NormalNav(ctx: context,screen: const CreateQuizScreen());
            //  Get.toNamed(Routes.createQuiz);
            },
          ),
          ListTile(
            leading: const Icon(Icons.quiz),
            title:  CustomText(
              txt: "Start quiz",
            ),
            onTap: () {
              NormalNav(ctx: context,screen: StartQuizScreen());
            },
          ),
          Divider(
            thickness: 1.2,
            indent: 20.w,
            endIndent: 20.w,
          ),
        ],
      ),
    );
  }
}
