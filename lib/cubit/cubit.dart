import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../module/answerMoel.dart';



class AppCubit extends Cubit <Appstates> {

  AppCubit() : super(InitialState()) ;
 static AppCubit get (context) => BlocProvider.of(context); // easly access data and use in muliple screens


   late Database database ;

  void createDB ()  {
    openDatabase('Quiz.db' , version: 1 ,
        onCreate: _onCreateData ,
        onOpen: (database) {
          print('DataBase opened');
        }
    ).then((value) {
      database = value ;
      getDataFromDB(database);
      print("herrrre$database");
      emit(AppCreateDBState());
    }) ;
  }

  Future<void> _onCreateData(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        ID INTEGER PRIMARY KEY,
        question TEXT,
        a TEXT,
        b TEXT,
        c TEXT,
        d TEXT,
        answer TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE users (
        ID INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT
      )
    ''');
    print ('creating DB');
  }

  Future addUser(String username, String email) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO users (username,email) VALUES ("$username","$email")')
          .then((value) {
        print('$value inserting user Done!');
        getDataFromDB(database);
        emit(AppInsertIntoDBState());
      }).catchError((error) {
        print('the error is ${error.toString()}');
      });
    });

  }


  Future addQuestion(
      {required String question,
        required String a,
        required String b,
        required String c,
        required String d,
        required String answer,
      }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO questions (question,a,b,c,d,answer) VALUES ("$question","$a","$b","$c","$d","$answer")')
          .then((value) {
        print('$value inserting Questions Done!');
        getDataFromDB(database);
        emit(AppInsertQuestionIntoDBState());
      }).catchError((error) {
        print('the error is ${error.toString()}');
      });
    });
  }
String? correct = 'A' ;
void changeDrowp (String? value) {
    correct = value ;
    emit(AppChangeCorrectAnswer());
}
  List <Map> questions = [];
  void getDataFromDB (database) {
    questions = [];
    emit(AppLoad());
    emit(AppGetLoadingState());
    database.rawQuery('SELECT * FROM questions').then((value) {
      print ('the value isss $value');
      value.forEach((element) {
        questions.add(element) ;
      }) ;
      emit(AppGetFromDBState());
    });
  }
  void delete (int id) async{
    await database.rawDelete('DELETE FROM questions WHERE ID = ?',['$id']).then((value) {
      getDataFromDB(database);
      emit(AppDeleteSuccefullState());
      getDataFromDB(database);
    });
  }

  int result = 0 ;
  int indexQuestion = 0 ;
  calculateResult() {
    result = 0;
    for (AnswerModel answer in answers) {
      if (answer.correctAnswer.toLowerCase() ==
          answer.chosenAnswer.toLowerCase()) {
        result += 1;
      }
    }
  }
  List<AnswerModel> answers = [];
  addAnswer(
      {required int idQuestion,
        required String chosenAnswer,
        required String correctAnswer}) {
    answers.add(
        AnswerModel(
          chosenAnswer: chosenAnswer,
          idQuestion: idQuestion,
          correctAnswer: correctAnswer,
        ));
    calculateResult();
    indexQuestion += 1;
    print("here index $indexQuestion") ;
    emit(AppAddAnswer());

  }



}