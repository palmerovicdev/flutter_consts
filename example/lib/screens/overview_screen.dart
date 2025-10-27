import 'package:consts/constants/app_font_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motionly/widget/text/animated_text.dart';
import 'package:consts/flutter_const.dart';

import '../theme/theme.dart';
import '../core/utils/responsive.dart';
import '../widgets/backgrounds/animated_background.dart';
import '../core/components/components.dart';

/// Página de overview con introducción al sistema de diseño
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: isNarrow ? 20 : 40),

              Icon(Icons.widgets, size: isNarrow ? 80 : 120, color: primary),

              SizedBox(height: isNarrow ? 24 : 32),

              AnimatedText(
                text: 'Consts - Flutter',
                splitType: SplitType.char,
                animationType: AnimationType.rotateVertical,
                duration: Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut,
                fontSize: context.getResponsiveFontSize(
                  smallest: AppFontSizesConstants.paragraphTitle,
                  largest: AppFontSizesConstants.h1,
                ),
                autoPlay: true,
              ),

              SizedBox(height: isNarrow ? 16 : 24),

              Text(
                'Sistema de constantes de diseño para Flutter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isNarrow
                    ? AppFontSizesConstants.body
                    : AppFontSizesConstants.bodyLarge,
                  color: textMuted,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: isNarrow ? 48 : 64),

              // Features Section
              Container(
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle('Sistemas Disponibles', isNarrow),
                    SizedBox(height: isNarrow ? 20 : 32),

                    buildFeatureGrid(isNarrow, _getFeatures()),

                    SizedBox(height: isNarrow ? 48 : 64),

                    // Best Practices
                    buildSectionTitle('Mejores Prácticas', isNarrow),
                    SizedBox(height: isNarrow ? 20 : 32),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isNarrow ? 1 : 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 240,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final practices = _getBestPractices();
                        return buildPracticeCard(
                          practices[index]['title'] as String,
                          practices[index]['items'] as List<String>,
                          practices[index]['color'] as Color,
                          isNarrow,
                        );
                      },
                    ),

                    SizedBox(height: isNarrow ? 48 : 64),

                    // Quick Start
                    buildSectionTitle('Inicio Rápido', isNarrow),
                    SizedBox(height: isNarrow ? 20 : 32),

                    buildCodeBlock('''// 1. Instala el paquete
flutter pub add flutter_const

// 2. Importa las constantes
import 'package:consts/flutter_const.dart';

// 3. Úsalas en tu código
Container(
  padding: AppSpacing.paddingMd,
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderLg,
  ),
  child: Text(
    'Hola Mundo',
    style: TextStyle(
      fontSize: AppFontSizesConstants.body,
    ),
  ),
)''', isNarrow),

                    SizedBox(height: isNarrow ? 40 : 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getFeatures() {
    return [
      {
        'icon': Icons.space_bar,
        'title': 'Spacing',
        'description':
            'Sistema de espaciado consistente con padding, gaps y margins predefinidos.',
      },
      {
        'icon': Icons.rounded_corner,
        'title': 'Radius',
        'description':
            'Border radius estandarizado para esquinas uniformes en toda la app.',
      },
      {
        'icon': Icons.photo_size_select_small,
        'title': 'Sizes',
        'description':
            'Tamaños base, iconos, avatares, elevaciones y breakpoints responsivos.',
      },
      {
        'icon': Icons.text_fields,
        'title': 'Fonts',
        'description':
            'Sistema tipográfico jerárquico con escalas configurables y responsive.',
      },
      {
        'icon': Icons.animation,
        'title': 'Durations',
        'description':
            'Duraciones de animación optimizadas siguiendo Material Design Motion.',
      },
      {
        'icon': Icons.check_circle,
        'title': 'Material 3',
        'description':
            'Completamente compatible con Material Design 3 y temas oscuros.',
      },
    ];
  }

  List<Map<String, dynamic>> _getBestPractices() {
    return [
      {
        'title': 'Consistencia',
        'color': primary,
        'items': [
          'Usa siempre las mismas constantes en toda la app',
          'Evita valores hardcodeados para spacing y radius',
          'Mantén una jerarquía visual clara',
        ],
      },
      {
        'title': 'Performance',
        'color': secondary,
        'items': [
          'Las constantes son compile-time, no runtime',
          'Sin overhead de rendimiento',
          'Optimizado para tree-shaking',
        ],
      },
      {
        'title': 'Escalabilidad',
        'color': info,
        'items': [
          'Fácil de mantener y actualizar',
          'Cambios globales con un solo ajuste',
          'Perfecto para design systems',
        ],
      },
      {
        'title': 'Accesibilidad',
        'color': success,
        'items': [
          'Tamaños táctiles mínimos de 48dp',
          'Contraste WCAG AA garantizado',
          'Tipografía legible y escalable',
        ],
      },
    ];
  }
}
