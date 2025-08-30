import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ComingSoonApp());
}

class ComingSoonApp extends StatelessWidget {
  const ComingSoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coming Soon',
      theme: ThemeData.dark(),
      home: const ComingSoonPage(),
    );
  }
}

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // ✅ Prevent overflow
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Card(
              elevation: 15,
              color: Colors.black.withOpacity(0.55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      "Crafting My Story ✨ Coming Soon",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      "Stay tuned for something amazing!",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    // Analog Clock
                    const SizedBox(
                      height: 280,
                      width: 280,
                      child: AnalogClock(),
                    ),

                    const SizedBox(height: 40),

                    // Launch Date
                    const Text(
                      "Launch Date: 18 Oct 2025",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.tealAccent,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Countdown Timer
                    const CountdownTimer(
                      launchDate: "2025-10-18 00:00:00",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------- Analog Clock ----------------
class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  late Timer _timer;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockPainter(_dateTime),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle
    final paintCircle = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    final paintBorder = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.tealAccent, Colors.blueAccent],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    canvas.drawCircle(center, radius - 10, paintCircle);
    canvas.drawCircle(center, radius - 10, paintBorder);

    // Hour, minute, second angles
    final hourAngle =
        (dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180;
    final minuteAngle = (dateTime.minute + dateTime.second / 60) * 6 * pi / 180;
    final secondAngle =
        (dateTime.second + dateTime.millisecond / 1000) * 6 * pi / 180;

    // Hands
    final hourHand = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    final minuteHand = Paint()
      ..color = Colors.tealAccent
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final secondHand = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Hour hand
    canvas.drawLine(
      center,
      Offset(center.dx + cos(hourAngle - pi / 2) * radius * 0.4,
          center.dy + sin(hourAngle - pi / 2) * radius * 0.4),
      hourHand,
    );

    // Minute hand
    canvas.drawLine(
      center,
      Offset(center.dx + cos(minuteAngle - pi / 2) * radius * 0.6,
          center.dy + sin(minuteAngle - pi / 2) * radius * 0.6),
      minuteHand,
    );

    // Second hand (smooth sweep)
    canvas.drawLine(
      center,
      Offset(center.dx + cos(secondAngle - pi / 2) * radius * 0.7,
          center.dy + sin(secondAngle - pi / 2) * radius * 0.7),
      secondHand,
    );

    // Center dot
    final centerDot = Paint()..color = Colors.white;
    canvas.drawCircle(center, 5, centerDot);

    // Tick marks + numbers
    final tickPaint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 1.5;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 1; i <= 60; i++) {
      final angle = i * 6 * pi / 180;
      final outer = Offset(center.dx + cos(angle) * (radius - 12),
          center.dy + sin(angle) * (radius - 12));
      final inner = Offset(
          center.dx +
              cos(angle) * (radius - (i % 5 == 0 ? 25 : 18)),
          center.dy +
              sin(angle) * (radius - (i % 5 == 0 ? 25 : 18)));
      canvas.drawLine(inner, outer, tickPaint);

      // Numbers (1–12)
      if (i % 5 == 0) {
        final number = (i ~/ 5).toString();
        final numberAngle = i * 6 * pi / 180;
        final offset = Offset(
          center.dx + cos(numberAngle - pi / 2) * (radius - 40),
          center.dy + sin(numberAngle - pi / 2) * (radius - 40),
        );

        textPainter.text = TextSpan(
          text: number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(blurRadius: 4, color: Colors.black, offset: Offset(1, 1)),
            ],
          ),
        );

        textPainter.layout();
        textPainter.paint(
          canvas,
          offset - Offset(textPainter.width / 2, textPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// ---------------- Countdown Timer ----------------
class CountdownTimer extends StatefulWidget {
  final String launchDate;

  const CountdownTimer({super.key, required this.launchDate});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late DateTime _launchDate;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _launchDate = DateTime.parse(widget.launchDate);
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _remaining = _launchDate.difference(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remaining.isNegative) {
      return const Text(
        "We are live now! 🎉",
        style: TextStyle(fontSize: 20, color: Colors.tealAccent),
      );
    }

    final days = _remaining.inDays;
    final hours = _remaining.inHours % 24;
    final minutes = _remaining.inMinutes % 60;
    final seconds = _remaining.inSeconds % 60;
    final ms = (_remaining.inMilliseconds % 1000) ~/ 10; // 2-digit ms

    return Column(
      children: [
        const Text(
          "Countdown",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "$days d : $hours h : $minutes m : $seconds s : $ms ms",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
