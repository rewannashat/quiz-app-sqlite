import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/cubit/cubit.dart';
import 'package:quiz_app/cubit/states.dart';

import '../layout/addQuestion-screen.dart';
import '../layout/createQuiz-screen.dart';
import '../style/colors.dart';
import '../style/constant.dart';
import '../style/custom_text.dart';
import 'answer-widget.dart';


class QuestionWidget extends StatelessWidget {
  @required late Map model ;

  QuestionWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(
        top: 15.h,
        start: 10.w,
        end: 10.w,
        bottom: 10.h,
      ),
      margin: EdgeInsetsDirectional.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: ColorsConst.secondColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: CustomText(
               txt: model['question'],
              height: 1.5,
            ),
            trailing: IconButton(
              onPressed: (){
                _showDeleteDialog(context, model['ID']);
              },

              icon: const Icon(Icons.delete),
            ),
          ),
          SizedBox(height: 5.h),
           AnswerWidget(
             onTap: () {},
             answer: model['a'],
             correct: model['answer'].toLowerCase() == "a",
           ),
          SizedBox(height: 13.h),
          AnswerWidget(
            onTap: () {},
            answer: model['b'],
            correct: model['answer'].toLowerCase() == "b",
          ),
          SizedBox(height: 13.h),
          AnswerWidget(
            onTap: () {},
            answer: model['c'],
            correct: model['answer'].toLowerCase() == "c",
          ),
          SizedBox(height: 13.h),
          AnswerWidget(
            onTap: () {},
            answer: model['d'],
            correct: model['answer'].toLowerCase() == "d",
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (BuildContext context) => AppCubit()..createDB(),
          child: BlocConsumer<AppCubit,Appstates>(
          listener: (BuildContext context, Object? state) {} ,
             builder: (BuildContext context, state) {
               var cubit = AppCubit.get(context).questions;
            return AlertDialog(
              title:  CustomText(
                txt: "Delete Item",
              ),
              content:  CustomText(
                txt: "Are you sure you want to delete this item?",
              ),
              actions: <Widget>[
                TextButton(
                  child:  CustomText(
                    txt: "Cancel",
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child:  CustomText(
                    txt: "Delete",
                    color: ColorsConst.primaryColor,
                  ),
                  onPressed: () {
                    AppCubit.get(context).delete(id);
                    Navigator.pop(context);
                    AnimatedSnackBar.material(
                      'Delete question successfully ......',
                      type: AnimatedSnackBarType.success,
                    ).show(context);
                  }
                ),
              ],
            );
    }

          ),
        );
      },
    );
  }
}
