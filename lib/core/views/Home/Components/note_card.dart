import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/todo/todo_model.dart';
import 'sub_category.dart';

class NoteCard extends StatelessWidget {
  late Todo nota;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 25, 38, 218),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Hacer Documentación de Agiles",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          Positioned.fill(
            top: 50,
            bottom: 50,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nonummy sagittis. Aliquam ante. Fadipiscing elit. Sed nonummy sagittis. Aliquam ante. Fadipiscing elit. Sed nonummy sagittis. Aliquam ante. Fadipiscing elit. Sed nonummy sagittis. Aliquam ante. Fadipiscing elit. Sed nonummy sagittis. Aliquam ante. Fdipiscing elit. Sed nonummy sagittis. Aliquam ante. Fusce semper, augue ac auctor commodo. Dignissim ullamcorper. Nulla facilisi. Proin condimentum. Curabitur euismod, justo ut.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2,
            child: Row(
              children: const [
                Icon(
                  Icons.warning_amber_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 4),
                Text(
                  "Prioridad alta",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 130,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 8),
                  BuildSubCategory("Category 1"),
                  SizedBox(width: 8),
                  BuildSubCategory("Category 2"),
                  SizedBox(width: 8),
                  BuildSubCategory("Category 3"),
                  SizedBox(width: 8),
                  BuildSubCategory("Category 4"),
                  SizedBox(width: 8),
                  BuildSubCategory("Category 5"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
