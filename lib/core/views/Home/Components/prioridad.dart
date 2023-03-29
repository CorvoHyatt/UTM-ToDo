import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrioridadWidget extends StatefulWidget {
  final Function(int) onPrioritySelected;

  PrioridadWidget({required this.onPrioritySelected});

  @override
  _PrioridadWidgetState createState() => _PrioridadWidgetState();
}

class _PrioridadWidgetState extends State<PrioridadWidget> {
  int _selectedPriority = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildOption('Prioridad Alta', CupertinoIcons.burn, 2),
        _buildOption('Prioridad Media', Icons.priority_high, 1),
        _buildOption('Prioridad Baja', Icons.low_priority_outlined, 0),
      ],
    );
  }

  Widget _buildOption(String option, IconData icon, int priority) {
    final isSelected = _selectedPriority == priority;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPriority = priority;
        });
        if (widget.onPrioritySelected != null) {
          widget.onPrioritySelected(priority);
        }
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(
            option,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
