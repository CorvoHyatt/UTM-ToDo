import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BuildSubCategory(String categoryName) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    child: Center(
      child: Text(
        categoryName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}
