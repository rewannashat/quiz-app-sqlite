import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/cubit/cubit.dart';
import 'package:quiz_app/cubit/states.dart';
import 'package:quiz_app/layout/result-screen.dart';

import '../module/answerMoel.dart';
import '../style/colors.dart';
import '../style/custom_text.dart';
import '../widget/answer-widget.dart';

class StartQuizScreen extends StatelessWidget {
   StartQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit,Appstates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context).questions;
          AppCubit appCubit = AppCubit.get(context);
       //   Map map = cubit[indexQuestion];
          print("hereeeeeeeeMAP${appCubit.indexQuestion+1}");
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
            body: cubit.isEmpty
                ? const Center(child:Text('Empty questions'))
                :cubit.length == appCubit.indexQuestion
                ? ResultQuizScreen(
              result: appCubit.result,
              length: cubit.length,
            )
                :  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        //${map['ID'] + 1} ${controller.indexQuestion + 1}
                        txt: "Question ${appCubit.indexQuestion+1}",
                        color: ColorsConst.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                      CustomText(
                        txt: "/ ${cubit.length}",
                        fontSize: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsConst.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomText(
                      //map['question']
                      txt: cubit[appCubit.indexQuestion]['question'],
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AnswerWidget(
                    answer: cubit[appCubit.indexQuestion]['a'],
                    onTap: () {
                      appCubit.addAnswer(
                        idQuestion: cubit[appCubit.indexQuestion]['ID'],
                        chosenAnswer: "a",
                        correctAnswer:cubit[appCubit.indexQuestion]['answer'],
                      );
                    },
                  ),
                  AnswerWidget(
                    answer:cubit[appCubit.indexQuestion]['b'],
                    onTap: () {
                      appCubit.addAnswer(
                        idQuestion: cubit[appCubit.indexQuestion]['ID'],
                        chosenAnswer: "b",
                        correctAnswer:cubit[appCubit.indexQuestion]['answer'],
                      );
                    },
                  ),
                  AnswerWidget(
                    answer: cubit[appCubit.indexQuestion]['c'],
                    onTap: () {
                      appCubit.addAnswer(
                        idQuestion: cubit[appCubit.indexQuestion]['ID'],
                        chosenAnswer: "c",
                        correctAnswer:cubit[appCubit.indexQuestion]['answer'],
                      );
                    },
                  ),
                  AnswerWidget(
                    answer: cubit[appCubit.indexQuestion]['d'],
                    onTap: () {
                      appCubit.addAnswer(
                        idQuestion: cubit[appCubit.indexQuestion]['ID'],
                        chosenAnswer: "d",
                        correctAnswer:cubit[appCubit.indexQuestion]['answer'],
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
