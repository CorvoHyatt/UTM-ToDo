import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(String) onColorSelected;

  ColorPicker({required this.onColorSelected});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color _selectedColor = Color(0xFF7F1B10);

  List<Color> _colors = [
    Color(0xFF7F1B10), // red
    Color(0xFF2F4256), // indigo
    Color(0xFF5C3B05), // orange
    Color(0xFF3A4521), // green
    Color(0xFF124364), // blue
    Color(0xFF4D3F04), // yellow
    Color(0xFF820D34), // pink
    Color(0xFF592F6A), // purple
  ];

  String getHexColor(Color color) {
    String hex = color.value.toRadixString(16).padLeft(8, '0');
    return '0x$hex';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _colors.map((color) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = color;
                widget.onColorSelected(getHexColor(color));
              });
            },
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: _selectedColor == color ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
