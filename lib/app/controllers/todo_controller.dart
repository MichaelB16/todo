import 'package:flutter/cupertino.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/repositories/todo_repository.dart';

class TodoController {
  final _reposity = TodoRepository();
  List<TodoModel> todos = [];

  final state = ValueNotifier<HomeState>(HomeState.start);

  start() async {
    state.value = HomeState.loading;
    try {
      todos = await _reposity.getAll();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { loading, start, success, error }
