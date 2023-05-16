import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/cubit/cubit.dart';
import 'package:quiz_app/cubit/states.dart';
import 'package:quiz_app/style/constant.dart';

import '../style/colors.dart';
import '../style/custom_button.dart';
import '../style/custom_text.dart';
import '../widget/question-widget.dart';
import 'addQuestion-screen.dart';

class CreateQuizScreen extends StatelessWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (BuildContext context) => AppCubit()..createDB(),
     child: BlocConsumer<AppCubit,Appstates>(
       listener: (BuildContext context, Object? state) {},
       builder: (BuildContext context, state) {
         var cubit = AppCubit.get(context).questions;
         return Scaffold(
           appBar: AppBar(
             title: CustomText(
               txt: "Create Quiz",
               color: Colors.white,
               fontSize: 20.sp,
               fontWeight: FontWeight.bold,
             ),
             centerTitle: true,
           ),
           body: Padding(
             padding: EdgeInsets.only(
               right: 20.w,
               left: 20.w,
               top: 20.h,
               bottom: 5.h,
             ),
             child: Column(
               children: [
                 CustomButton(
                   colorButton: ColorsConst.primaryColor,
                   txt: "+     Add new question",
                   borderRadius: 12,
                   onPressed:(){
                     NormalNav(ctx: context, screen: AddQuestionScreen());
                   } ,
                   width: 250.w, high: 60.h, outLineBorder: false,
                 ),
                 SizedBox(height: 30.h),
                 ConditionalBuilder(
                   condition: state is! AppLoad ,
                   fallback: (context) => Center(
                     child: LoadingAnimationWidget.threeRotatingDots(
                       color: Colors.black38,
                       size: 35.sp,
                     ),
                   ),
                   builder:(context) {
                     print("ITS CHECKKK ${cubit.length}");
                     return Expanded(
                     child: ListView.builder(
                       itemCount: cubit.length,
                       itemBuilder: (context, index) {
                         return QuestionWidget(
                           model: cubit[index],
                         );
                       },
                     ),
                   );
                   },
                 ),
               ],
             ),
           ),
         );
       },

     ),
   );
  }
}
