library picker;

import 'package:flutter/material.dart';

// Color Picker
class ColorPicker extends StatefulWidget {
  final List<Color> colors;
  final Color selectedColor;
  final VoidCallback onCall;
  final double height;
  final Function(Color) selectChangeColor;
  ColorPicker(
      {@required this.colors,
      @required this.selectedColor,
      this.onCall,
      @required this.selectChangeColor,
      this.height});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color currentSelectedColor;

  @override
  void initState() {
    super.initState();
    currentSelectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select a Color',
        style: TextStyle(
            color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('Close'),
        ),
      ],
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: widget.height != null ? widget.height : 250,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 2,
            mainAxisSpacing: 15.0,
          ),
          itemBuilder: (context, index) {
            return currentSelectedColor == widget.colors[index]
                ? Stack(
                    children: [
                      ButtonTheme(
                        buttonColor: widget.colors[index],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minWidth: 50,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              currentSelectedColor = widget.colors[index];
                              widget.selectChangeColor(widget.colors[index]);
                            });
                          },
                          color: widget.colors[index],
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.done,
                          size: 35,
                          color: currentSelectedColor == Colors.white
                              ? Colors.black
                              : Colors.white,
                        ),
                      )
                    ],
                  )
                : ButtonTheme(
                    buttonColor: widget.colors[index],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    minWidth: 50,
                    height: 12,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          currentSelectedColor = widget.colors[index];
                          widget.selectChangeColor(widget.colors[index]);
                        });
                      },
                      color: widget.colors[index],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
