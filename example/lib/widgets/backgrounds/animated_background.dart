import 'package:flutter/material.dart';
import 'package:flutter_motionly/widget/backgrounds/particles_animation.dart';

/// Widget que envuelve contenido con un fondo de partículas animadas
class AnimatedBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? particleColors;
  final int? particleCount;
  final double? velocityFactor;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.particleColors,
    this.particleCount,
    this.velocityFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo de partículas
        Positioned.fill(
          child: ParticleBox(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
            velocityFactor: velocityFactor ?? 0.3,
            particleCount: particleCount ?? 200,
            heightFactor: 5,
            colors:
                particleColors ??
                [
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
                  Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.5),
                  Colors.blue.withValues(alpha: 0.4),
                  Colors.cyan.withValues(alpha: 0.4),
                ],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        // Contenido sobre las partículas
        child,
      ],
    );
  }
}
