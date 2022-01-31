import 'package:flutter_test/flutter_test.dart';
import 'package:todo/app/controllers/todo_controller.dart';

main() {
  final controller = TodoController();
  test('alimentar todo', () async {
    await controller.start();
  });
}
