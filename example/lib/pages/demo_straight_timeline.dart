import 'package:flutter/material.dart';
import 'package:custom_fl_timeline/custom_fl_timeline.dart';

class DemoStraightTimeline extends StatelessWidget {
  const DemoStraightTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Straight Timeline'),
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
                  timelineType: TimelineType.straight,
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
                    timelineType: TimelineType.straight,
                    timelineOrientation: TimelineOrientation.vertical,
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
