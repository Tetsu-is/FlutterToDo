import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:myapp/components/out_lined_text_field_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TODO APP")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedTextField(
                label: 'Email',
                placeholder: 'Enter your email',
                onChange: (value) => debugPrint(value),
                icon: Icons.email,
              ),
              OutlinedTextField(
                label: 'Password',
                placeholder: 'Enter your password',
                onChange: (value) => debugPrint(value),
                icon: CupertinoIcons.eye,
                inputMode: InputMode.password,
                //add icon and ontap->open modal
                childIcon: const Icon(Icons.info_outline_rounded, size: 25),
              )
            ],
          ),
        ));
  }
}
