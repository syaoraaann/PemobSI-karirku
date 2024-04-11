// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class AnimatedIcon extends StatefulWidget {
  final IconData normalIcon;
  final IconData pressedIcon;
  final bool isPressed;

  const AnimatedIcon({
    Key? key,
    required this.normalIcon,
    required this.pressedIcon,
    required this.isPressed,
  }) : super(key: key);

  @override
  State<AnimatedIcon> createState() => _AnimatedIconState();
}

class _AnimatedIconState extends State<AnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    if (widget.isPressed) {
      _controller.value = 1; // Start as pressed
    }
  }

  @override
  void didUpdateWidget(AnimatedIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPressed != widget.isPressed) {
      if (widget.isPressed) {
        _controller.forward(); // Animate to pressed state
      } else {
        _controller.reverse(); // Animate back to normal state
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Icon(
          value < 0.5 ? widget.normalIcon : widget.pressedIcon,
          color: value < 0.5
              ? Colors.blue
              : Colors.blueAccent, // Adjust colors as needed
        );
      },
    );
  }
}
