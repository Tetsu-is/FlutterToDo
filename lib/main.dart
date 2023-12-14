import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final TextEditingController _controller = TextEditingController();
    final todoArray = useState([]);

    return Scaffold(
        appBar: AppBar(title: const Text("TODO APP")),
        body: Column(
          children: [
            TextField(
              focusNode: _focusNode,
              controller: _controller,
            ),
            TextButton(
                onPressed: () {
                  _focusNode.unfocus();
                  todoArray.value = [...todoArray.value, _controller.text];
                  _controller.clear();
                },
                child: Text("OK")),
            Expanded(
                child: ListView.builder(
              itemCount: todoArray.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoArray.value[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      final newList = [...todoArray.value];
                      newList.removeAt(index);
                      todoArray.value = newList;
                    },
                  ),
                );
              },
            ))
          ],
        ));
  }
}
