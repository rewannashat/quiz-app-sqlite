import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/colors.dart';
import '../style/custom_text.dart';

class AnswerWidget extends StatelessWidget {
  final bool correct;

  const AnswerWidget({
  super.key,
  required this.onTap,
  required this.answer,
  this.correct = false,
  });

  final String answer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10,left: 12,right: 12),
        padding: EdgeInsetsDirectional.only(
          top: 25.h,
          start: 10.w,
          end: 10.w,
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal),
          color: correct ? Colors.green : ColorsConst.backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: CustomText(
          txt: answer,
          height: 1.3,
          color: correct ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
