import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController buttonAnimationController,
    required this.press,
  }) : _buttonAnimationController = buttonAnimationController;

  final RiveAnimationController _buttonAnimationController;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 63,
        width: 259,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_buttonAnimationController],
            ),
            Positioned.fill(
              top: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.rocket),
                  SizedBox(
                    width: 7,
                  ),
                  Text("Get started!",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
