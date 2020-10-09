# picker

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
### Example

```dart

import 'package:cpicker/picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: selectedColor,
        child: Center(
            child: RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return ColorPicker(
                  colors: [
                    Colors.red,
                    Colors.green,
                    Colors.grey,
                    Colors.white,
                    Colors.blue,
                    Colors.blueAccent,
                    Colors.redAccent,
                    Colors.black12
                  ],
                  selectedColor: Colors.red,
                  selectChangeColor: (Color color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  onCall: () {
                    print('Picked color');
                  },
                );
              },
            );
          },
          child: Text("Show Color Picker"),
        )));
  }
}

### Image Description
https://github.com/safalstha142/picker/blob/master/Screenshot_1602044249.png


