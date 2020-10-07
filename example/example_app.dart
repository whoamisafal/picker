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
