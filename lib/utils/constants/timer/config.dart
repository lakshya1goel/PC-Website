import 'package:slide_countdown/slide_countdown.dart';

StreamDuration streamDuration = StreamDuration(
  config: const StreamDurationConfig(
    isCountUp: false,
    autoPlay: true,
    periodic: Duration(seconds: 1),
    countDownConfig: CountDownConfig(
      duration: Duration(days: 2),
    ),
  ),
);
