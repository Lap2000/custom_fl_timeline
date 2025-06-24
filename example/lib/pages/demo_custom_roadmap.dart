import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/flutter_roadmap.dart';

class DemoCustomRoadmap extends StatelessWidget {
  const DemoCustomRoadmap({super.key});

  @override
  Widget build(BuildContext context) {
    /// Dummy
    final data = <StepValue>[
      StepValue(
        'Delivery successful.',
        time: DateTime(2025, 2, 1, 11, 30),
        isActivated: true,
        extraValue: <Widget>[
          InkWell(
            onTap: () => log('View image -> clicked'),
            child: const Text(
              'View image.',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
      StepValue(
        'Your order is being delivered to your address. Please await a phone call.',
        time: DateTime(2025, 1, 31, 7, 30),
      ),
      StepValue(
        'Your order has been picked up and is now being transported to the Shanghai international warehouse. Delivery time may be extended due to some customs clearance issues. We appreciate your understanding.',
        time: DateTime(2025, 1, 26, 9, 06),
      ),
      StepValue('Waiting for pickup.', time: DateTime(2025, 1, 25, 16, 30)),
      StepValue('Place an order.', time: DateTime(2025, 1, 22, 10, 30)),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Custom Roadmap'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomRoadMap(
                values: data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
