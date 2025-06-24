import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';

class DemoStraightTimeline extends StatelessWidget {
  const DemoStraightTimeline({super.key});

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
                child: SimpleTimeline(
                  circleRadius: 30,
                  roadmapType: RoadmapType.straight,
                  values: <TimelineMilestone>[
                    TimelineMilestone('A', color: Colors.orangeAccent),
                    TimelineMilestone('B', color: Colors.greenAccent),
                    TimelineMilestone('C', color: Colors.yellowAccent),
                    TimelineMilestone('D', color: Colors.redAccent),
                    TimelineMilestone('E', color: Colors.blueAccent),
                  ],
                ),
              ),
              Container(
                color: Colors.pinkAccent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SimpleTimeline(
                    circleRadius: 40,
                    roadmapType: RoadmapType.straight,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
