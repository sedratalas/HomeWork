import 'dart:math';
import 'package:flutter/material.dart';
import '../model/clock_model.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({super.key});

  Stream<ClockTime> getTime() async* {
    while (true) {
      final now = DateTime.now();
      yield ClockTime(
        second: now.second,
        minute: now.minute,
        hour: now.hour % 12,
      );
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor =  Color(0xffEFE9E9);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: StreamBuilder<ClockTime>(
          stream: getTime(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffCFAFB0),
                    offset: const Offset(14, 14),
                    blurRadius: 12,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-8, -8),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  for (int i = 0; i < 4; i++)
                    Transform.rotate(
                      angle: (pi / 2) * i,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 2,
                          height: 12,
                          color: const Color(0xff9D9393),
                        ),
                      ),
                    ),
                  Center(
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffCFAFB0),
                            offset: const Offset(7, 7),
                            blurRadius: 14,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            //Color(0xffFAF6F5),
                            offset: Offset(-7, -7),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: CustomPaint(
                        painter: ClockPainter(snapshot.data!),
                        size: const Size(300, 300),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
class ClockPainter extends CustomPainter {
  final ClockTime time;
  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final secondAngle = (pi / 30) * time.second;
    final minuteAngle = (pi / 30) * time.minute + (pi / 1800) * time.second;
    final hourAngle = (pi / 6) * time.hour + (pi / 360) * time.minute;


    final hourHand = Paint()
      ..color = Color(0xffA8A4A3)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final hourEnd = center +
        Offset(cos(hourAngle - pi / 2), sin(hourAngle - pi / 2)) * radius * 0.75;

    canvas.drawLine(center, hourEnd, hourHand);


    final minuteHand = Paint()
      ..color = Color(0xff341115)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final minuteEnd = center +
        Offset(cos(minuteAngle - pi / 2), sin(minuteAngle - pi / 2)) *
            radius *
            1.2;

    canvas.drawLine(center, minuteEnd, minuteHand);

    final secondHand = Paint()
      ..color = Color(0xffC9A9AC)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final secondEnd = center +
        Offset(cos(secondAngle - pi / 2), sin(secondAngle - pi / 2)) *
            radius *
            0.9;

    canvas.drawLine(center, secondEnd, secondHand);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
