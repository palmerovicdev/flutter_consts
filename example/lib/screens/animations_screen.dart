import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

import '../theme/theme.dart';
import '../core/utils/responsive.dart';
import '../widgets/backgrounds/animated_background.dart';
import '../core/components/components.dart';

/// Pantalla de demostración de duraciones de animación
class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  bool _isExpanded = false;
  bool _isVisible = true;
  double _rotation = 0;

  @override
  Widget build(BuildContext context) {
    final isNarrow = Responsive.isMobile(context);

    return AnimatedBackground(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isNarrow ? 24.0 : 48.0,
          vertical: isNarrow ? 24.0 : 48.0,
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSectionTitle('AppDurations', isNarrow),
                SizedBox(height: 16),
                Text(
                  'Duraciones estandarizadas siguiendo Material Design Motion',
                  style: TextStyle(
                    fontSize: isNarrow ? 14 : 16,
                    color: textMuted,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isNarrow ? 32 : 48),
                // AnimatedContainer Demo
                buildExampleCard(
                  'AnimatedContainer',
                  'Transición suave entre estados usando AppDurations.md (300ms)',
                  isNarrow,
                  Column(
                    children: [
                      Center(
                        child: AnimatedContainer(
                          duration: AppDurations.md,
                          curve: Curves.easeInOut,
                          width: _isExpanded ? 200 : 120,
                          height: _isExpanded ? 200 : 120,
                          decoration: BoxDecoration(
                            color: _isExpanded ? primary : secondary,
                            borderRadius: _isExpanded
                                ? BorderRadius.circular(32)
                                : BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.animation,
                              color: Colors.white,
                              size: _isExpanded ? 48 : 28,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() => _isExpanded = !_isExpanded);
                        },
                        icon: Icon(_isExpanded ? Icons.compress : Icons.expand),
                        label: Text(_isExpanded ? 'Contraer' : 'Expandir'),
                      ),
                    ],
                  ),
                  '''// AnimatedContainer con duración
AnimatedContainer(
  duration: AppDurations.md,  // 300ms
  curve: Curves.easeInOut,
  width: isExpanded ? 200 : 120,
  decoration: BoxDecoration(
    color: isExpanded ? primary : secondary,
  ),
)''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // AnimatedOpacity Demo
                buildExampleCard(
                  'AnimatedOpacity',
                  'Fade in/out suave usando AppDurations.xl (500ms)',
                  isNarrow,
                  Column(
                    children: [
                      Center(
                        child: AnimatedOpacity(
                          duration: AppDurations.xl,
                          opacity: _isVisible ? 1.0 : 0.0,
                          curve: Curves.easeInOut,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: success,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.visibility,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: success,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() => _isVisible = !_isVisible);
                        },
                        icon: Icon(
                          _isVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                        label: Text(_isVisible ? 'Ocultar' : 'Mostrar'),
                      ),
                    ],
                  ),
                  '''// AnimatedOpacity
AnimatedOpacity(
  duration: AppDurations.xl,  // 500ms
  opacity: isVisible ? 1.0 : 0.0,
  curve: Curves.easeInOut,
  child: widget,
)''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // AnimatedRotation Demo
                buildExampleCard(
                  'Rotación Animada',
                  'Rotación suave usando AppDurations.lg (400ms)',
                  isNarrow,
                  Column(
                    children: [
                      Center(
                        child: AnimatedRotation(
                          duration: AppDurations.lg,
                          turns: _rotation,
                          curve: Curves.easeInOut,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.rotate_right,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() => _rotation += 0.25);
                        },
                        icon: Icon(Icons.rotate_90_degrees_ccw),
                        label: Text('Rotar 90°'),
                      ),
                    ],
                  ),
                  '''// AnimatedRotation
AnimatedRotation(
  duration: AppDurations.lg,  // 400ms
  turns: rotation,
  curve: Curves.easeInOut,
  child: widget,
)''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Duration Scale
                buildExampleCard(
                  'Escala de Duraciones',
                  'De instantáneo (50ms) a muy lento (600ms)',
                  isNarrow,
                  Column(
                    children: [
                      _buildDurationRow('XXS - Ultra rápido', '50ms'),
                      _buildDurationRow('XS - Extra rápido', '100ms'),
                      _buildDurationRow('SM - Muy rápido', '150ms'),
                      _buildDurationRow('SMD - Rápido', '200ms'),
                      _buildDurationRow('MD - Mediano ⭐', '300ms'),
                      _buildDurationRow('LG - Lento', '400ms'),
                      _buildDurationRow('XL - Extra lento', '500ms'),
                      _buildDurationRow('XXL - Muy lento', '600ms'),
                    ],
                  ),
                  '''// Escala completa de duraciones
AppDurations.xxs   // 50ms  - Hover effects
AppDurations.xs    // 100ms - Micro-interactions
AppDurations.sm    // 150ms - Page transitions
AppDurations.smd   // 200ms - Quick changes
AppDurations.md    // 300ms - Standard animations
AppDurations.lg    // 400ms - Emphasis animations
AppDurations.xl    // 500ms - Slower animations
AppDurations.xxl   // 600ms - Dramatic effects''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Special Durations
                buildExampleCard(
                  'Duraciones Especializadas',
                  'Optimizadas para casos de uso específicos',
                  isNarrow,
                  Column(
                    children: [
                      _buildSpecialDuration(
                        'Search Debounce',
                        '300ms',
                        'Evita llamadas API excesivas al escribir',
                        Icons.search,
                      ),
                      _buildSpecialDuration(
                        'Tooltip Delay',
                        '500ms',
                        'Delay antes de mostrar tooltips',
                        Icons.help_outline,
                      ),
                      _buildSpecialDuration(
                        'Snackbar Duration',
                        '2000ms',
                        'Tiempo visible de notificaciones',
                        Icons.notifications,
                      ),
                      _buildSpecialDuration(
                        'Page Transition',
                        '150ms',
                        'Transición rápida entre páginas',
                        Icons.swap_horiz,
                      ),
                      _buildSpecialDuration(
                        'Hover Effect',
                        '100ms',
                        'Feedback instantáneo al pasar cursor',
                        Icons.touch_app,
                      ),
                    ],
                  ),
                  '''// Duraciones especializadas
AppDurations.searchDebounce    // 300ms
AppDurations.tooltipDelay      // 500ms
AppDurations.snackbarDuration  // 2000ms
AppDurations.pageTransition    // 150ms
AppDurations.hoverEffect       // 100ms''',
                ),

                SizedBox(height: isNarrow ? 48 : 64),

                // Best Practices
                buildPracticeCard(
                  'Mejores Prácticas',
                  [
                    'Usa AppDurations.md (300ms) como duración estándar',
                    'Las animaciones rápidas (<200ms) son mejores para micro-interacciones',
                    'Animaciones lentas (>400ms) solo para efectos dramáticos',
                    'Siempre usa Curves apropiadas (easeInOut, easeOut, etc.)',
                    'Considera el rendimiento: animaciones largas pueden ser costosas',
                  ],
                  primary,
                  isNarrow,
                ),

                SizedBox(height: isNarrow ? 40 : 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDurationRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label, style: TextStyle(color: text, fontSize: 13)),
          ),
          Text(
            value,
            style: TextStyle(
              color: primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialDuration(
    String label,
    String value,
    String description,
    IconData icon,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: info.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: info.withValues(alpha: 0.3)),
            ),
            child: Icon(icon, size: 20, color: info),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: text,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        color: primary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
