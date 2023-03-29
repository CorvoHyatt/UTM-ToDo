import 'package:flutter/material.dart';
import 'package:to_do_app/core/views/Home/Components/custom_add_todo_dialog.dart';

import 'Components/note_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isAddTodoShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () {
            Future.delayed(Duration(milliseconds: 2), () {
              setState(() {
                isAddTodoShow = true;
              });
              customAddTodoDialog(context, onClosed: (_) {
                setState(() {
                  isAddTodoShow = false;
                });
              });
            });
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
            GestureDetector(
              onLongPress: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(0, 0, 0, 0),
                  items: [
                    PopupMenuItem(
                      child: Text('Borrar'),
                      onTap: () {
                        // Acción para borrar
                      },
                    ),
                    PopupMenuItem(
                      child: Text('Editar'),
                      onTap: () {
                        // Acción para editar
                      },
                    ),
                  ],
                );
              },
              child: NoteCard(),
            ),
          ],
        ),
      ),
    );
  }
}
