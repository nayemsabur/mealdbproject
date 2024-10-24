import 'package:flutter/material.dart';


class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Stack(
      children: [
       //Todo: ImageBackground
        SafeArea(child: child),
      ],
    );
  }
}
