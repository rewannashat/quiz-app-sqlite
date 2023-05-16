import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/shared/bloc_observer.dart';
import 'package:quiz_app/style/colors.dart';

import 'cubit/cubit.dart';
import 'layout/drawer.dart';
import 'layout/home-screen.dart';



void main() {
   Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
   ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        appBarTheme: const AppBarTheme(
        backgroundColor: ColorsConst.primaryColor,
        iconTheme: IconThemeData(
        color: Colors.white,
    ),
    elevation: 0,
    ),
          inputDecorationTheme: InputDecorationTheme(
            focusColor: ColorsConst.primaryColor,
            labelStyle: const TextStyle(color: Colors.white),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 2,
                color: ColorsConst.primaryColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 2,
                color: ColorsConst.primaryColor,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
          ),
          drawerTheme: DrawerThemeData(
            backgroundColor: ColorsConst.backgroundColor,
          ),
          scaffoldBackgroundColor: ColorsConst.backgroundColor,
        ),
      home: BlocProvider(
        create:(BuildContext context) => AppCubit()..createDB(),
        child: ScreenUtilInit(
          designSize: const Size(393, 808),
          builder: (context, child) => HomeScreen()
        ),
      ),
    );
  }
}


