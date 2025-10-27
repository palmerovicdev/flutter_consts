import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

import '../theme/theme.dart';
import '../core/utils/responsive.dart';
import '../widgets/backgrounds/animated_background.dart';
import '../core/components/components.dart';

/// Pantalla de demostración del sistema de espaciado
class SpacingScreen extends StatelessWidget {
  const SpacingScreen({super.key});

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
                buildSectionTitle('AppSpacing', isNarrow),
                SizedBox(height: 16),
                Text(
                  'Sistema de espaciado consistente para padding, margins y gaps',
                  style: TextStyle(
                    fontSize: isNarrow
                      ? AppFontSizesConstants.bodySmall
                      : AppFontSizesConstants.body,
                    color: textMuted,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isNarrow ? 32 : 48),

                // Padding Examples
                buildExampleCard(
                  'Padding Uniforme',
                  'EdgeInsets con padding igual en todos los lados',
                  isNarrow,
                  _buildPaddingDemo(context, isNarrow),
                  '''// Usar padding uniforme
Container(
  padding: AppSpacing.paddingMd,
  child: Text('Contenido'),
)

// Escala disponible
AppSpacing.paddingXxs  // 2.0
AppSpacing.paddingXs   // 4.0
AppSpacing.paddingSm   // 6.0
AppSpacing.paddingMd   // 12.0
AppSpacing.paddingLg   // 16.0
AppSpacing.paddingXl   // 20.0
AppSpacing.paddingXxl  // 24.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Horizontal Padding
                buildExampleCard(
                  'Padding Horizontal',
                  'EdgeInsets solo en los lados izquierdo y derecho',
                  isNarrow,
                  _buildHorizontalDemo(context, isNarrow),
                  '''// Usar padding horizontal
Container(
  padding: AppSpacing.horizontalMd,
  child: Text('Contenido'),
)

// Escala disponible
AppSpacing.horizontalXs  // 4.0
AppSpacing.horizontalSm  // 8.0
AppSpacing.horizontalMd  // 16.0
AppSpacing.horizontalLg  // 24.0
AppSpacing.horizontalXl  // 32.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Vertical Gaps
                buildExampleCard(
                  'Gaps Verticales',
                  'SizedBox para espaciado vertical entre widgets',
                  isNarrow,
                  _buildVerticalGapsDemo(context, isNarrow),
                  '''// Usar gaps verticales
Column(
  children: [
    Widget1(),
    AppSpacing.gapMd,
    Widget2(),
  ],
)

// Escala disponible
AppSpacing.gapXxs  // SizedBox(height: 2)
AppSpacing.gapXs   // SizedBox(height: 4)
AppSpacing.gapSm   // SizedBox(height: 6)
AppSpacing.gapMd   // SizedBox(height: 12)
AppSpacing.gapLg   // SizedBox(height: 16)
AppSpacing.gapXl   // SizedBox(height: 20)
AppSpacing.gapXxl  // SizedBox(height: 24)''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Horizontal Gaps
                buildExampleCard(
                  'Gaps Horizontales',
                  'SizedBox para espaciado horizontal entre widgets',
                  isNarrow,
                  _buildHorizontalGapsDemo(context, isNarrow),
                  '''// Usar gaps horizontales
Row(
  children: [
    Widget1(),
    AppSpacing.gapHorizontalMd,
    Widget2(),
  ],
)

// Escala disponible
AppSpacing.gapHorizontalXxs  // SizedBox(width: 2)
AppSpacing.gapHorizontalXs   // SizedBox(width: 4)
AppSpacing.gapHorizontalSm   // SizedBox(width: 6)
AppSpacing.gapHorizontalMd   // SizedBox(width: 12)
AppSpacing.gapHorizontalLg   // SizedBox(width: 16)
AppSpacing.gapHorizontalXl   // SizedBox(width: 20)
AppSpacing.gapHorizontalXxl  // SizedBox(width: 24)''',
                ),

                SizedBox(height: isNarrow ? 48 : 64),

                // Best Practices
                buildPracticeCard(
                  'Mejores Prácticas',
                  [
                    'Usa siempre las constantes predefinidas en lugar de valores hardcodeados',
                    'Prefiere gapMd para espaciado estándar entre elementos',
                    'Usa paddingLg para contenedores principales',
                    'Los gaps son más semánticos que Container con height/width',
                    'Mantén la consistencia en toda la aplicación',
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

  Widget _buildPaddingDemo(BuildContext context, bool isNarrow) {
    final sizes = [
      ('XXS', AppSpacing.paddingXxs),
      ('XS', AppSpacing.paddingXs),
      ('SM', AppSpacing.paddingSm),
      ('MD', AppSpacing.paddingMd),
      ('LG', AppSpacing.paddingLg),
      ('XL', AppSpacing.paddingXl),
      ('XXL', AppSpacing.paddingXxl),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: sizes.map((size) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: border.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: size.$2,
            decoration: BoxDecoration(
              color: primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              size.$1,
              style: TextStyle(
                color: text,
                fontSize: AppFontSizesConstants.bodySmall,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildHorizontalDemo(BuildContext context, bool isNarrow) {
    final sizes = [
      ('XS', AppSpacing.horizontalXs),
      ('SM', AppSpacing.horizontalSm),
      ('MD', AppSpacing.horizontalMd),
      ('LG', AppSpacing.horizontalLg),
      ('XL', AppSpacing.horizontalXl),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sizes.map((size) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: border.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: size.$2,
              decoration: BoxDecoration(
                color: secondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Horizontal ${size.$1}',
                style: TextStyle(
                  color: text,
                  fontSize: AppFontSizesConstants.bodySmall,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildVerticalGapsDemo(BuildContext context, bool isNarrow) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgLight.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGapItem('XXS Gap', 2),
          AppSpacing.gapXxs,
          _buildGapItem('XS Gap', 4),
          AppSpacing.gapXs,
          _buildGapItem('SM Gap', 6),
          AppSpacing.gapSm,
          _buildGapItem('MD Gap', 12),
          AppSpacing.gapMd,
          _buildGapItem('LG Gap', 16),
          AppSpacing.gapLg,
          _buildGapItem('XL Gap', 20),
        ],
      ),
    );
  }

  Widget _buildHorizontalGapsDemo(BuildContext context, bool isNarrow) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgLight.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: border.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            _buildGapItem('XXS', 2),
            AppSpacing.gapHorizontalXxs,
            _buildGapItem('XS', 4),
            AppSpacing.gapHorizontalXs,
            _buildGapItem('SM', 6),
            AppSpacing.gapHorizontalSm,
            _buildGapItem('MD', 12),
            AppSpacing.gapHorizontalMd,
            _buildGapItem('LG', 16),
          ],
        ),
      ),
    );
  }

  Widget _buildGapItem(String label, double size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: info.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: info.withValues(alpha: 0.3)),
      ),
      child: Text(
        '$label (${size}px)',
        style: TextStyle(
          color: text,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
