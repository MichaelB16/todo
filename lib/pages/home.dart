import 'package:flutter/material.dart';
import 'package:todo/app/controllers/todo_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TodoController();

  _loading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.purple,
      ),
    );
  }

  _start() {
    return Container();
  }

  _success() {
    return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (value) {},
            ),
            title: Text(todo.title.toString()),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.start();
          },
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          child: const Text('Tente novamente!')),
    );
  }

  changeState(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("My todo"),
        actions: [
          IconButton(
              onPressed: () {
                controller.start();
              },
              padding: const EdgeInsets.all(6),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return changeState(controller.state.value);
          }),
    );
  }
}
