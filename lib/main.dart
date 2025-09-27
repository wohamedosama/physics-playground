import 'package:flutter/material.dart';
import 'package:physics_playground/draggable_colors.dart';

void main() {
  runApp(PhysicsPlayground());
}

class PhysicsPlayground extends StatelessWidget {
  const PhysicsPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DraggableColors(),
    );
  }
}
