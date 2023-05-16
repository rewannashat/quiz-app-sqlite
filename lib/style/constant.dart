

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future NavAndRemove ({screen , ctx}) {
  return  Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder:  (ctx) => screen,), (route) => false);
}
Future NormalNav ({screen,ctx}) {
  return  Navigator.push(ctx, MaterialPageRoute(builder:(ctx) => screen,));
}

loading (double size) {
  return LoadingAnimationWidget.hexagonDots(
    size: size,
    color: Colors.grey.withOpacity(0.3),
  );
}