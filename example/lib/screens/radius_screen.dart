import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

import '../theme/theme.dart';
import '../core/utils/responsive.dart';
import '../widgets/backgrounds/animated_background.dart';
import '../core/components/components.dart';

/// Pantalla de demostración del sistema de border radius
class RadiusScreen extends StatelessWidget {
  const RadiusScreen({super.key});

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
                buildSectionTitle('AppRadius', isNarrow),
                SizedBox(height: 16),
                Text(
                  'Sistema de border radius consistente para esquinas uniformes',
                  style: TextStyle(
                    fontSize: isNarrow ? 14 : 16,
                    color: textMuted,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isNarrow ? 32 : 48),

                // BorderRadius Examples
                buildExampleCard(
                  'Border Radius',
                  'Escala completa de border radius para diferentes componentes',
                  isNarrow,
                  _buildRadiusDemo(context, isNarrow),
                  '''// Usar border radius
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderMd,
  ),
  child: content,
)

// Escala disponible
AppRadius.borderXs    // 4.0
AppRadius.borderSm    // 6.0
AppRadius.borderSmd   // 8.0
AppRadius.borderMd    // 12.0
AppRadius.borderLg    // 16.0
AppRadius.borderXl    // 20.0
AppRadius.borderXxl   // 24.0
AppRadius.borderHuge  // 32.0
AppRadius.circular    // 999.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Shapes Examples
                buildExampleCard(
                  'Shapes (RoundedRectangleBorder)',
                  'Shapes predefinidos para botones y cards',
                  isNarrow,
                  _buildShapesDemo(context, isNarrow),
                  '''// Usar shapes en botones
ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: AppRadius.shapeMd,
  ),
  onPressed: () {},
  child: Text('Botón'),
)

// Shapes disponibles
AppRadius.shapeXs   // 4.0
AppRadius.shapeSm   // 6.0
AppRadius.shapeSmd  // 8.0
AppRadius.shapeMd   // 12.0
AppRadius.shapeLg   // 16.0
AppRadius.shapeXl   // 20.0
AppRadius.shapeXxl  // 24.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Partial Borders
                buildExampleCard(
                  'Bordes Parciales',
                  'Border radius solo en esquinas específicas',
                  isNarrow,
                  _buildPartialBordersDemo(context, isNarrow),
                  '''// Solo esquinas superiores
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.onlyTop(AppSizes.md),
  ),
)

// Métodos disponibles
AppRadius.onlyTop(size)     // Top-left & Top-right
AppRadius.onlyBottom(size)  // Bottom-left & Bottom-right
AppRadius.onlyLeft(size)    // Top-left & Bottom-left
AppRadius.onlyRight(size)   // Top-right & Bottom-right''',
                ),

                SizedBox(height: isNarrow ? 48 : 64),

                // Best Practices
                buildPracticeCard(
                  'Mejores Prácticas',
                  [
                    'Usa borderMd (12px) para la mayoría de los componentes',
                    'Usa borderSm (6px) para elementos pequeños como chips',
                    'Usa borderLg (16px) para cards y modales',
                    'Usa circular (999px) para botones pill y avatares circulares',
                    'Mantén la consistencia: no mezcles múltiples radios en un mismo componente',
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

  Widget _buildRadiusDemo(BuildContext context, bool isNarrow) {
    final radii = [
      ('XS', AppRadius.borderXs),
      ('SM', AppRadius.borderSm),
      ('SMD', AppRadius.borderSmd),
      ('MD', AppRadius.borderMd),
      ('LG', AppRadius.borderLg),
      ('XL', AppRadius.borderXl),
      ('XXL', AppRadius.borderXxl),
      ('HUGE', AppRadius.borderHuge),
      ('CIRCULAR', BorderRadius.circular(999)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isNarrow ? 2 : 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 100,
      ),
      itemCount: radii.length,
      itemBuilder: (context, index) {
        final item = radii[index];
        return Container(
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.1),
            borderRadius: item.$2,
            border: Border.all(color: primary.withValues(alpha: 0.3), width: 2),
          ),
          child: Center(
            child: Text(
              item.$1,
              style: TextStyle(
                color: text,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShapesDemo(BuildContext context, bool isNarrow) {
    final shapes = [
      ('XS', AppRadius.shapeXs),
      ('SM', AppRadius.shapeSm),
      ('SMD', AppRadius.shapeSmd),
      ('MD', AppRadius.shapeMd),
      ('LG', AppRadius.shapeLg),
      ('XL', AppRadius.shapeXl),
      ('XXL', AppRadius.shapeXxl),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: shapes.map((shape) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondary.withValues(alpha: 0.2),
            foregroundColor: text,
            shape: shape.$2,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          onPressed: () {},
          child: Text(
            shape.$1,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPartialBordersDemo(BuildContext context, bool isNarrow) {
    final partials = [
      ('Top', AppRadius.onlyTop(AppSizes.lg)),
      ('Bottom', AppRadius.onlyBottom(AppSizes.lg)),
      ('Left', AppRadius.onlyLeft(AppSizes.lg)),
      ('Right', AppRadius.onlyRight(AppSizes.lg)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isNarrow ? 2 : 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 100,
      ),
      itemCount: partials.length,
      itemBuilder: (context, index) {
        final item = partials[index];
        return Container(
          decoration: BoxDecoration(
            color: info.withValues(alpha: 0.1),
            borderRadius: item.$2,
            border: Border.all(color: info.withValues(alpha: 0.3), width: 2),
          ),
          child: Center(
            child: Text(
              item.$1,
              style: TextStyle(
                color: text,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
