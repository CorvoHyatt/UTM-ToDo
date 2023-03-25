import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'components/Animated_button.dart';
import 'components/sign_in_form.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  bool isSingInDialogShow = false;
  late RiveAnimationController _buttonAnimationController;
  @override
  void initState() {
    _buttonAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset("assets/Backgrounds/Spline.png"),
        ),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        )),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        )),
        AnimatedPositioned(
          top: isSingInDialogShow ? -50 : 0,
          duration: Duration(milliseconds: 240),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  width: 260,
                  child: Column(
                    children: const [
                      Text("To-Do App UTM",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Maximize your potential as a student with our powerful to-do app - your ultimate organizational tool for success!",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                AnimatedBtn(
                  buttonAnimationController: _buttonAnimationController,
                  press: () {
                    _buttonAnimationController.isActive = true;
                    Future.delayed(Duration(milliseconds: 800), () {
                      setState(() {
                        isSingInDialogShow = true;
                      });
                      customSignInDialog(context, onClosed: (_) {
                        setState(() {
                          isSingInDialogShow = true;
                        });
                      });
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Join over 120 students who are already using the To-do UTM app to stay organized and on top of their tasks! Download the app today and make managing your to-do list a breeze.",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          )),
        )
      ],
    ));
  }

  Future<Object?> customSignInDialog(BuildContext context,
      {required ValueChanged onClosed}) {
    return showGeneralDialog(
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
      pageBuilder: (context, _, __) => Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: 543,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 34,
                            fontFamily: "Poppins",
                          ),
                        ),
                        const Text(
                          "Get started on the path to academic success - log in to our student to-do app today!",
                          textAlign: TextAlign.center,
                        ),
                        const SignInForm(),
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
                          padding: const EdgeInsets.only(top: 24, bottom: 8),
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
                                  minimumSize: const Size(double.infinity, 56)),
                              onPressed: () {
                                Navigator.pop(context);
                              }, //TODO: Formulario de registro
                              icon: const Icon(CupertinoIcons.add_circled,
                                  color: Color(0xFFFE0037)),
                              label: const Text("Sign Up")),
                        )
                      ],
                    ),
                    const Positioned(
                      bottom: -48,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ).then(onClosed);
  }
}
