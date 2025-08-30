import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Floating animated bubbles
          const AnimatedBackground(),

          // Main content
          Center(
            child: Card(
              elevation: 12,
              color: Colors.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Animated text
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText("We're Launching Soon..."),
                          TyperAnimatedText("Stay Tuned!"),
                          TyperAnimatedText("Exciting Things Ahead 🚀"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Subtitle
                    const Text(
                      "Something amazing is on the way.",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),

                    const SizedBox(height: 30),

                    // Email / Notify button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Notify Me",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Social icons
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     FaIcon(FontAwesomeIcons.facebook, color: Colors.white, size: 32),
                    //     SizedBox(width: 16),
                    //     FaIcon(FontAwesomeIcons.instagram, color: Colors.white, size: 32),
                    //     SizedBox(width: 16),
                    //     FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 32),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated floating background bubbles
class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: BubblePainter(_controller.value),
          child: Container(),
        );
      },
    );
  }
}

class BubblePainter extends CustomPainter {
  final double value;

  BubblePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white24;
    final bubbles = [
      Offset(size.width * 0.2, size.height * (0.2 + 0.5 * value)),
      Offset(size.width * 0.5, size.height * (0.7 - 0.6 * value)),
      Offset(size.width * 0.8, size.height * (0.3 + 0.4 * value)),
    ];
    for (var bubble in bubbles) {
      canvas.drawCircle(bubble, 40, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
