import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/views/Home/Components/add_todo_form.dart';
import 'package:to_do_app/core/views/Onboard/components/sign_in_form.dart';
import 'package:to_do_app/core/views/Onboard/components/sign_up_form.dart';

Future<Object?> customAddTodoDialog(BuildContext context,
    {required ValueChanged onClosed}) async {
  await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Add To-Do",
      context: context,
      transitionDuration: Duration(milliseconds: 600),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      pageBuilder: (context, _, __) {
        return StatefulBuilder(builder: (context, setState) {
          return Center(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: 580,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.94),
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    reverse: true,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Add To-Do",
                              style: const TextStyle(
                                fontSize: 34,
                                fontFamily: "Poppins",
                              ),
                            ),
                            SizedBox(height: 12),
                            AddTodoForm(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      }).then(onClosed);
}
