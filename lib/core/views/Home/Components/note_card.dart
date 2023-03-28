import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

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
              children: [
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
        ],
      ),
    );
  }
}
