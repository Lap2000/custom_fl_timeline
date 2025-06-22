import 'package:flutter/material.dart';
import 'package:flutter_roadmap/flutter_roadmap.dart';

class CustomMilestone extends StatelessWidget {
  const CustomMilestone({
    super.key,
    required this.text,
    this.children = const <Widget>[],
    this.circleAtTheEnd = false,
  });
  final String text;
  final List<Widget> children;
  final bool circleAtTheEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 50,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('20/12/2024'),
                Text('08:01'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomStepRoadmap(
                    radius: 5,
                    text: '',
                    filledColor: Colors.grey,
                    pixelPadding: 0,
                    padding: EdgeInsets.only(top: 10),
                  ),
                  if (!circleAtTheEnd)
                    Expanded(
                      child: CustomPaint(
                        painter: StraightConnectedLine(
                          hasArrow: false,
                          horizontalX: 0,
                          horizontalY: 0,
                          color: Colors.grey,
                          type: ConnectedLineType.solid,
                          dashGap: 1,
                          dashLength: 2,
                          limitExpand: 10,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(),
                    maxLines: null,
                    softWrap: true,
                  ),
                  ...[const SizedBox(height: 6), ...children],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
