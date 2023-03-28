import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:to_do_app/core/views/Onboard/components/custom_signIn_Dialog.dart';
import 'components/animated_button.dart';
import 'components/sign_in_form.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  bool isSingInDialogShow = false;
  bool _showDialog = false;
  bool _showLogin = true;
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
        resizeToAvoidBottomInset: true,
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
                              isSingInDialogShow = false;
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
}
