import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/states.dart';
import 'package:sqflite/sqflite.dart';
import '../shared.dart';

class TodoBloc extends Cubit<TodoStates> {
  TodoBloc() : super(InitialStates());

  static TodoBloc get(context) => BlocProvider.of<TodoBloc>(context);
  late Database database;
  var isChecked = false;

  void CreateDataBase() async {
    database = await openDatabase('note.db', version: 1,
        onCreate: (database, version) {
      debugPrint('db creted');
      database
          .execute(
              'CREATE TABLE tasks(ID INTEGER PRIMARY KEY, title TEXT, date TEXT, startTime TEXT, endTime TEXT, remind INTEGER, repeat TEXT)')
          .then((value) {
        debugPrint('table created');
      }).catchError((error) {
        'error when create table ${error.toString()}';
      });
    }, onOpen: (database) {
      GetDataFromDataBase(database).then((value) {
        tasks = value;
        debugPrint('tasks');
      });
      debugPrint('table opend ');
    });
  }

  void InsertDataBase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
  }) {
    database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks(title, date, startTime, endTime, remind, repeat) VALUES("$title","$date","$startTime","$endTime","null","null")')
          .then((value) {
        debugPrint('$value isert done ');
      }).catchError((error) {
        'error when insert table ${error.toString()}';
      });
    });
  }

  Future<List<Map>> GetDataFromDataBase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }

  upDateDatabase({
    required String status,
    required int id,
  }) async {
    await database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value) {
      GetDataFromDataBase(database);
    });
  }

  void DeletDatabase({
    required int id,
  }) async {
    await database
        .rawDelete('DELETE FROM tasks WHERE id = ?', ['$id']).then((value) {
      GetDataFromDataBase(database);
    });
  }
}
