import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:to_do_app/core/views/Home/Components/color_picker.dart';
import 'package:to_do_app/core/views/Home/Components/prioridad.dart';

import '../../../utils/hexcolor.dart';
import '../../EntryPoint/entry_point.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({
    super.key,
  });

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isShowloading = false;
  bool _isShowConfetti = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;
  String _selectedColor = "0x000000";
  int _selectedPriority = 1;

  void _handlePrioritySelected(int priority) {
    setState(() {
      _selectedPriority = priority;
    });
  }

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void _handleColorSelected(String hex) {
    setState(() {
      _selectedColor = hex;
    });
  }

  void addTodo(BuildContext context) {
    setState(() {
      _isShowloading = true;
      _isShowConfetti = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      if (_formkey.currentState!.validate()) {
        check.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isShowloading = false;
          });
          confetti.fire();
          Future.delayed(Duration(seconds: 1), () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EntryPoint()));
          });
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isShowloading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Titulo", style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (tittle) {},
                  obscureText: false,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(CupertinoIcons.pencil),
                    ),
                  )),
                ),
              ),
              const Text("Contenido", style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (content) {},
                  obscureText: false,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(CupertinoIcons.doc_checkmark),
                    ),
                  )),
                ),
              ),
              const Text("Color", style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: ColorPicker(onColorSelected: (color) {
                  setState(() {
                    _selectedColor = color;
                    print(color);
                  });
                }),
              ),
              const Text("Prioridad", style: TextStyle(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: PrioridadWidget(
                    onPrioritySelected: _handlePrioritySelected),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24),
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
                      addTodo(context);
                    },
                    icon: const Icon(CupertinoIcons.arrow_right,
                        color: Color(0xFFFE0037)),
                    label: const Text("Add new To-Do")),
              )
            ],
          ),
        ),
        _isShowloading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : SizedBox(),
        _isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv",
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard);
                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            width: size,
            height: 100,
            child: child,
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
