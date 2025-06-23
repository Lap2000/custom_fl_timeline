import 'package:flutter/material.dart';
import 'helper/enums/enums.dart';
import 'model/model.dart';

import 'widgets/widgets.dart';

class CustomRoadMap extends StatelessWidget {
  const CustomRoadMap({
    super.key,
    this.circleRadius = 25,
    required this.values,
    this.roadmapType = RoadmapType.curve,
    this.roadmapOrientation = RoadMapOrientation.horizontal,
    this.height = 0,
    this.width = 0,
  });

  final double circleRadius;
  final List<StepValue> values;
  final RoadmapType roadmapType;
  final RoadMapOrientation roadmapOrientation;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final List<StepValue> milestoneList = <StepValue>[
      StepValue('Đặt hàng', time: DateTime.now()),
      StepValue('Chờ lấy hàng', time: DateTime.now()),
      StepValue(
          'Hàng đã lấy, đang chuyển hàng đến kho quốc tế ShanHai. Thời gian có lẽ sẽ kéo dài do vấn đề thuế quan. Xin quý khách thông cảm.',
          time: DateTime.now()),
      StepValue('Giao hàng thành công', time: DateTime.now()),
    ];
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: milestoneList.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomMilestone(
                item: milestoneList[index],
                circleAtTheEnd: index == milestoneList.length - 1,
                isActivated: index == 0,
                children: <Widget>[
                  if (index == 0)
                    InkWell(
                      onTap: () {}, // TODO(lappd): handle onTap.
                      child: const Text(
                        'Xem hình ảnh',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
