import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool firstSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.size(
      current: firstSwitchValue,
      values: const [false, true],
      iconOpacity: 0.2,
      indicatorSize: const Size.fromWidth(100),
      customIconBuilder: (context, local, global) => Text(
        local.value ? 'Blue' : 'White',
        style: TextStyle(
          color: Color.lerp(Colors.black, Colors.white, local.animationValue),
        ),
      ),
      borderWidth: 5.0,
      iconAnimationType: AnimationType.onHover,
      style: ToggleStyle(
        indicatorColor: const Color.fromARGB(255, 0, 38, 66),
        borderColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      selectedIconScale: 1.0,
      onChanged: (value) => setState(() {
        firstSwitchValue = value;
      }),
    );
  }
}
