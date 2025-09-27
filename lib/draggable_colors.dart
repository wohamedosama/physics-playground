import 'package:flutter/material.dart';

class DraggableColors extends StatefulWidget {
  const DraggableColors({super.key});

  @override
  State<DraggableColors> createState() => _DraggableColorsState();
}

class _DraggableColorsState extends State<DraggableColors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text('Physics Playground'),
        backgroundColor: Colors.transparent,
        elevation: 0.4,
      ),
      body: Column(children: []),
    );
  }
}
