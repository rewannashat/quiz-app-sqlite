import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/custom_text_field.dart';


class AddQuestionWidget extends StatelessWidget {
  TextEditingController? controller ;
   AddQuestionWidget(TextEditingController controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTextFormField(
          controller: controller,
          label: "Question",
          hintTxt: "Question",
          prefexIcon: Icons.question_mark,
          color: Colors.grey,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}