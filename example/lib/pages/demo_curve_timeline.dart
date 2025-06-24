import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';

class DemoCurveTimeline extends StatelessWidget {
  const DemoCurveTimeline({super.key});

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
              SimpleTimeline(
                circleRadius: 30,
                values: <TimelineMilestone>[
                  TimelineMilestone('A', color: Colors.orangeAccent),
                  TimelineMilestone('B', color: Colors.greenAccent),
                  TimelineMilestone('C', color: Colors.yellowAccent),
                  TimelineMilestone('D', color: Colors.redAccent),
                  TimelineMilestone('E', color: Colors.blueAccent),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SimpleTimeline(
                  circleRadius: 30,
                  roadmapType: RoadmapType.curve,
                  roadmapOrientation: RoadMapOrientation.vertical,
                  values: <TimelineMilestone>[
                    TimelineMilestone('A', color: Colors.orangeAccent),
                    TimelineMilestone('B', color: Colors.greenAccent),
                    TimelineMilestone('C', color: Colors.yellowAccent),
                    TimelineMilestone('D', color: Colors.redAccent),
                    TimelineMilestone('E', color: Colors.blueAccent),
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
