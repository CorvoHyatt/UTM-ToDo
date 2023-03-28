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
              width: 260,
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
