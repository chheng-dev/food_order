import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const FilterButton({required this.title, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected == false ? Colors.white : Colors.green,
          shape: StadiumBorder(),
          side: BorderSide(width: 1, color: Colors.green),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
              color: isSelected == false ? Colors.green : Colors.white),
        ),
      ),
    );
  }
}
