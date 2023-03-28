import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/views/Onboard/components/sign_in_form.dart';
import 'package:to_do_app/core/views/Onboard/components/sign_up_form.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) async {
  bool _showLogin = true;
  await showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign in",
      context: context,
      transitionDuration: Duration(milliseconds: 600),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
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
                height: _showLogin ? 546 : 746,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
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
                              _showLogin ? "Sign In" : "Sign Up",
                              style: const TextStyle(
                                fontSize: 34,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Text(
                              _showLogin
                                  ? "Get started on the path to academic success - log in to our student to-do app today!"
                                  : "Join the thousands of successful students who use our to-do app - sign up now for free!",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12),
                            _showLogin ? SignInForm() : SignUpForm(),
                            Row(
                              children: const [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text("OR",
                                      style: TextStyle(color: Colors.black26)),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 0),
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(25),
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25),
                                        ),
                                      ),
                                      backgroundColor: const Color(0xFFF77D8E),
                                      minimumSize:
                                          const Size(double.infinity, 56)),
                                  onPressed: () {
                                    setState(() {
                                      _showLogin = !_showLogin;
                                    });
                                  },
                                  icon: const Icon(CupertinoIcons.add_circled,
                                      color: Color(0xFFFE0037)),
                                  label: _showLogin
                                      ? Text("Sign Up")
                                      : Text("Sign In")),
                            )
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
