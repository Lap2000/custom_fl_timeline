import 'package:custom_fl_timeline/custom_fl_timeline.dart';

final customTimelineData = <TimelineMilestone>[
  TimelineMilestone(
    'Delivery successful.',
    time: DateTime(2025, 2, 1, 11, 30),
    isActivated: true,
  ),
  TimelineMilestone(
    'Your order is being delivered to your address. Please await a phone call.',
    time: DateTime(2025, 1, 31, 7, 30),
  ),
  TimelineMilestone(
    'Your order has been picked up and is now being transported to the Shanghai international warehouse. Delivery time may be extended due to some customs clearance issues. We appreciate your understanding.',
    time: DateTime(2025, 1, 26, 9, 06),
  ),
  TimelineMilestone('Waiting for pickup.', time: DateTime(2025, 1, 25, 16, 30)),
  TimelineMilestone('Place an order.', time: DateTime(2025, 1, 22, 10, 30)),
];
