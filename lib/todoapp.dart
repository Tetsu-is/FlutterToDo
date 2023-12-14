import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddingPage extends HookWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mytasks = useState(<String>[]);

    //define controller
    final myController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("mytask"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                hintText: 'Enter a search term',
              ),
              onSubmitted: (String value) {
                mytasks.value.add(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mytasks.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(mytasks.value[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
