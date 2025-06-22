import 'package:flutter/material.dart';
import 'package:flutter_roadmap/flutter_roadmap.dart';

class DemoCustomRoadmap extends StatelessWidget {
  const DemoCustomRoadmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Custom Roadmap'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 500,
                color: Colors.white,
                child: CustomRoadMap(
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
            ],
          ),
        ),
      ),
    );
  }
}
