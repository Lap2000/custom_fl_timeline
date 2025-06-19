import 'package:flutter/material.dart';
import 'package:flutter_roadmap/flutter_roadmap.dart';

class DemoCurveRoadmap extends StatelessWidget {
  const DemoCurveRoadmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Curve Roadmap'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RoadMap(
                circleRadius: 30,
                values: <StepValue>[
                  StepValue('A', color: Colors.orangeAccent),
                  StepValue('B', color: Colors.greenAccent),
                  StepValue('C', color: Colors.yellowAccent),
                  StepValue('D', color: Colors.redAccent),
                  StepValue('E', color: Colors.blueAccent),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: RoadMap(
                  circleRadius: 30,
                  roadmapType: RoadmapType.curve,
                  roadmapOrientation: RoadMapOrientation.vertical,
                  values: <StepValue>[
                    StepValue('A', color: Colors.orangeAccent),
                    StepValue('B', color: Colors.greenAccent),
                    StepValue('C', color: Colors.yellowAccent),
                    StepValue('D', color: Colors.redAccent),
                    StepValue('E', color: Colors.blueAccent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
