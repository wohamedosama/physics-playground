import 'package:flutter/material.dart';

class DraggableColors extends StatefulWidget {
  const DraggableColors({super.key});

  @override
  State<DraggableColors> createState() => _DraggableColorsState();
}

Map<String, bool> matchedBall = {'red': false, 'blue': false, 'green': false};

class _DraggableColorsState extends State<DraggableColors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text('Physics Playground'),
        backgroundColor: Colors.transparent,
        elevation: 0.4,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Draggable balls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDraggables("red", Colors.red),
              _buildDraggables("blue", Colors.blue),
              _buildDraggables("green", Colors.green),
            ],
          ),
          const SizedBox(height: 150),
          // Drop targets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDragTarget("red", Colors.red),
              _buildDragTarget("blue", Colors.blue),
              _buildDragTarget("green", Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  // Draggable Ball
  Widget _buildDraggables(String colorKey, Color color) {
    return Draggable<String>(
      data: colorKey,
      feedback: _buildBall(color, 50, opacity: 0.7),
      childWhenDragging: _buildBall(color.withValues(alpha: 0.3), 50),
      child: matchedBall[colorKey]!
          ? const SizedBox(width: 50, height: 50)
          : _buildBall(color, 50),
    );
  }

  // Drag Target
  Widget _buildDragTarget(String colorKey, Color color) {
    return DragTarget<String>(
      onWillAcceptWithDetails: (data) => true,
      onAcceptWithDetails: (data) {
        setState(() {
          if (data.data == colorKey) {
            matchedBall[colorKey] = true;
          }
        });
      },
      builder: (context, accepted, rejected) {
        bool isActive = accepted.isNotEmpty;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 80,
          height: 80,
          decoration: _buildDraggableTargetBoxDecoration(
            isActive,
            color,
            colorKey,
          ),
        );
      },
    );
  }

  Widget _buildBall(Color color, double size, {double opacity = 1}) {
    return Container(
      width: size,
      height: size,
      decoration: _buildBallContainerBoxDecoration(color, opacity),
    );
  }

  BoxDecoration _buildDraggableTargetBoxDecoration(
    bool isActive,
    Color color,
    String colorKey,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 2, color: isActive ? Colors.black : color),
      color: matchedBall[colorKey]!
          ? color.withValues(alpha: 0.6)
          : color.withValues(alpha: 0.2),
    );
  }

  BoxDecoration _buildBallContainerBoxDecoration(Color color, double opacity) {
    return BoxDecoration(
      color: color.withValues(alpha: opacity),
      shape: BoxShape.circle,
    );
  }
}
