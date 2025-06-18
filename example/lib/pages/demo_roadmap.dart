import 'package:flutter/material.dart';
import 'package:flutter_roadmap/flutter_roadmap.dart';

class DemoRoadmap extends StatelessWidget {
  const DemoRoadmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Painter'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RoadMap(
                pointerRadius: 30,
                values: <StepValue>[
                  StepValue('A', color: Colors.orangeAccent),
                  StepValue('B', color: Colors.greenAccent),
                  StepValue('C', color: Colors.yellowAccent),
                  StepValue('D', color: Colors.redAccent),
                  StepValue('E', color: Colors.blueAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
