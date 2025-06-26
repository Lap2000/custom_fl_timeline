import 'dart:developer';

import 'package:example/mocks/custom_timeline_data.dart';
import 'package:flutter/material.dart';
import 'package:custom_fl_timeline/custom_fl_timeline.dart';

class DemoCustomTimeline2 extends StatelessWidget {
  const DemoCustomTimeline2({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTimeline(
      values: customTimelineData,
      circleRadius: 10,
      itemPadding: 40,
      connectorType: PainterType.dash,
      circleBorderWidth: 2,
      circleBorderColor: (context, index) =>
          index == 0 ? Colors.green : Colors.black,
      extraWidgetBuilder: (context, index) {
        return index == 0
            ? <Widget>[
                InkWell(
                  onTap: () => log('View image -> clicked'),
                  child: const Text(
                    'View image.',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ]
            : [];
      },
      childMilestoneBuilder: (context, index) {
        return Icon(
          Icons.done,
          color: Colors.white,
          size: 15,
        );
      },
    );
  }
}
