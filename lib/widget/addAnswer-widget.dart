
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/custom_text.dart';
import '../style/custom_text_field.dart';



class AddAnswerWidget extends StatelessWidget {
  const AddAnswerWidget({
  super.key,
  required this.textEditingController,
  required this.hint,
  required this.label,
  required this.color,
  required this.order,
  });

  final TextEditingController textEditingController;
  final Color color;
  final String hint;
  final String label;
  final String order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          alignment: Alignment.center,
          child: Center(
            child: CustomText(
              txt: order,
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: CustomTextFormField(
            controller: textEditingController,
            label: label,
            hintTxt: hint,

            validator: (String? v){
              if (v!.isEmpty) {
                return 'must not be empty' ;
              } else {
                return null ;
              }
            },
          ),
        ),
      ],
    );
  }
}
