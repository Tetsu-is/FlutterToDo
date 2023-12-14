import 'main.dart';
import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  final _todoController = TextEditingController();
  String _todo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //TextField
            Container(
              child: TextField(
                controller: _todoController,
                onChanged: (text) => _todo = text,
              ),
            ),
            Row(
              children: [
                //add button
                TextButton(
                  child: Text("ADD"),
                  onPressed: () {
                    Navigator.pop(context, _todo);
                  },
                ),
                //close button
                TextButton(
                  child: Text("CLOSE"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
