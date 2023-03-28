import 'package:flutter/material.dart';

import 'Components/note_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(
            bottom: 80), // Mueve el botón flotante 50 píxeles hacia arriba
        child: FloatingActionButton(
          onPressed: () {
            // Acción a realizar cuando se presione el botón
          },
          backgroundColor: const Color(0xFF17203A),
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "To-Do's",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
              ),
            ),
            Container(
              height: 280,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 25, 38, 218),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(),
            ),
          ],
        ),
      ),
    );
  }
}
