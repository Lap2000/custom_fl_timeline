import 'package:flutter/material.dart';
import 'package:flutter_roadmap/flutter_roadmap.dart';

class DemoStraightRoadmap extends StatelessWidget {
  const DemoStraightRoadmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Straight Roadmap'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.purpleAccent,
                child: RoadMap(
                  circleRadius: 30,
                  roadmapType: RoadmapType.straight,
                  values: <StepValue>[
                    StepValue('A', color: Colors.orangeAccent),
                    StepValue('B', color: Colors.greenAccent),
                    StepValue('C', color: Colors.yellowAccent),
                    StepValue('D', color: Colors.redAccent),
                    StepValue('E', color: Colors.blueAccent),
                  ],
                ),
              ),
              Container(
                color: Colors.pinkAccent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: RoadMap(
                    circleRadius: 40,
                    roadmapType: RoadmapType.straight,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
