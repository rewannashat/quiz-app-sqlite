import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/cubit/cubit.dart';
import 'package:quiz_app/cubit/states.dart';

import '../style/colors.dart';
import '../style/custom_button.dart';
import '../style/custom_text.dart';
import '../style/custom_text_field.dart';
import '../widget/addAnswer-widget.dart';

import '../widget/addOneQuestion-widget.dart';
import '../widget/question-widget.dart';



class AddQuestionScreen extends StatelessWidget {
    AddQuestionScreen({super.key});

  TextEditingController controller = TextEditingController();

  TextEditingController answer1 = TextEditingController();

  TextEditingController answer2 = TextEditingController();

  TextEditingController answer3 = TextEditingController();

  TextEditingController answer4 = TextEditingController();

  String? correct ='A';

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
  //  AppCubit cubit = AppCubit.get(context);
    return BlocProvider(
      create: (context) => AppCubit()..createDB(),
      child: BlocConsumer<AppCubit,Appstates>(
      listener: (BuildContext context, Object? state) {},
    builder: (BuildContext context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: CustomText(
              txt: "Add Question",
              color: ColorsConst.primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorsConst.primaryColor,
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      AddQuestion(controller!),
                      AnswerList(answer1!,answer2,answer3,answer4),
                      RightAnswer(correct!,context),
                      CustomButton(
                        txt: "Add question",
                        colorButton: ColorsConst.primaryColor,
                        onPressed: (){
                          if(formkey.currentState!.validate()) {
                          cubit.addQuestion(question: controller.text, a: answer1.text, b: answer2.text, c: answer3.text, d: answer4.text, answer: cubit.correct!,);
                          controller.clear();
                          answer1.clear();
                          answer2.clear();
                          answer3.clear();
                          answer4.clear();
                          AnimatedSnackBar.material(
                            'Add question successfully ......',
                            type: AnimatedSnackBarType.success,
                          ).show(context);
                          }
                        },
                        width: 260.w, high: 50.h, outLineBorder: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],

          ),
        );
    }

      ),
    );

  }
}

Widget AddQuestion (TextEditingController controller) {

  return Column(
    children: [
      CustomTextFormField(
        controller: controller,

        validator: (String? v){
          if (v!.isEmpty) {
            return 'Question must not be empty' ;
          } else {
            return null ;
          }
        },
        label: "Question",
        hintTxt: "Question",
        prefexIcon: Icons.question_mark,
        color: Colors.grey,
      ),
      SizedBox(height: 40.h),
    ],
  );
}

Widget AnswerList (TextEditingController answer1,answer2,answer3,answer4) {

  return Column(
    children: [
      AddAnswerWidget(
        textEditingController: answer1,
        hint: "First answer",
        label: "First answer",
        color: Colors.yellow.shade600,
        order: "A",
      ),
      SizedBox(height: 20.h),
      AddAnswerWidget(
        textEditingController: answer2,
        hint: "Second answer",
        label: "Second answer",
        color: Colors.green.shade600,
        order: "B",
      ),
      SizedBox(height: 20.h),
      AddAnswerWidget(
        textEditingController: answer3,
        hint: "Third answer",
        label: "Third answer",
        color: Colors.blueGrey.shade600,
        order: "C",
      ),
      SizedBox(height: 20.h),
      AddAnswerWidget(
        textEditingController: answer4,
        hint: "Fourth answer",
        label: "Fourth answer",
        color: Colors.pink.shade600,
        order: "D",
      ),
    ],
  );
}

Widget RightAnswer(String correct,BuildContext context) {
  return  Column(
    children: [
      SizedBox(
        height: 40.h,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(txt: "Select the correct answer"),
          DropdownButton(
            value: AppCubit.get(context).correct,
            items: ['A', 'B', 'C', 'D'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: CustomText(
                  txt: value,
                  color: ColorsConst.primaryColor,
                ),
              );
            }).toList(),
            onChanged: (String? value) {
             // correct = value! ;
             AppCubit.get(context).changeDrowp(value!);
            // print(value);
            },
          )
        ],
      ),
      SizedBox(height: 50.h),
    ],
  );
}
