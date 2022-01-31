import 'package:dio/dio.dart';
import 'package:todo/app/models/todo_model.dart';

class TodoRepository {
  final String url = 'https://jsonplaceholder.typicode.com/todos';
  final dio = Dio();

  Future<List<TodoModel>> getAll() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((item) => TodoModel.fromJson(item)).toList();
  }
}
