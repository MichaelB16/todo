import 'package:flutter_test/flutter_test.dart';
import 'package:todo/app/repositories/todo_repository.dart';

void main() {
  final repository = TodoRepository();
  test('lista de todo', () async {
    var result = await repository.getAll();
    expect(result[0].title, 'delectus aut autem');
  });
}
