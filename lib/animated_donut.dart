import 'package:flutter/material.dart';

class AnimatedDonut extends StatefulWidget {
  const AnimatedDonut({super.key});

  @override
  State<AnimatedDonut> createState() => _AnimatedDonutState();
}

class _AnimatedDonutState extends State<AnimatedDonut>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotationAnimation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    rotationAnimation =
        Tween<double>(begin: 0, end: 1).animate(controller);

    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.purple)
            .animate(controller);

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Donut Chart")),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: rotationAnimation.value * 5.5,
              child: CustomPaint(
                size: const Size(200, 200),
                painter: DonutPainter(colorAnimation.value ?? Colors.blue),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DonutPainter extends CustomPainter {
  final Color color;

  DonutPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawArc(
      rect,
      0,
      4.5,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}