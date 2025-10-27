import 'package:flutter/material.dart';
import 'package:consts/flutter_const.dart';

import '../theme/theme.dart';
import '../core/utils/responsive.dart';
import '../widgets/backgrounds/animated_background.dart';
import '../core/components/components.dart';

/// Pantalla de demostración de tamaños (AppSizes & AppUI)
class SizesScreen extends StatelessWidget {
  const SizesScreen({super.key});

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
                buildSectionTitle('AppSizes & AppUI', isNarrow),
                SizedBox(height: 16),
                Text(
                  'Tamaños base, iconos, avatares, elevaciones y breakpoints responsivos',
                  style: TextStyle(
                    fontSize: isNarrow
                      ? AppFontSizesConstants.bodySmall
                      : AppFontSizesConstants.body,
                    color: textMuted,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: isNarrow ? 32 : 48),

                // Icon Sizes
                buildExampleCard(
                  'Tamaños de Iconos',
                  'De 12px a 48px siguiendo Material Design',
                  isNarrow,
                  Wrap(
                    spacing: isNarrow ? 16 : 24,
                    runSpacing: isNarrow ? 16 : 24,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _buildIconExample('XS', AppUI.iconXs, Icons.star),
                      _buildIconExample('SM', AppUI.iconSm, Icons.star),
                      _buildIconExample('MD', AppUI.iconMd, Icons.star),
                      _buildIconExample('LG', AppUI.iconLg, Icons.star),
                      _buildIconExample('XL', AppUI.iconXl, Icons.star),
                      _buildIconExample('XXL', AppUI.iconXxl, Icons.star),
                      _buildIconExample('Huge', AppUI.iconHuge, Icons.star),
                    ],
                  ),
                  '''// Tamaños de iconos
Icon(Icons.home, size: AppUI.iconXs)    // 12.0
Icon(Icons.home, size: AppUI.iconSm)    // 16.0
Icon(Icons.home, size: AppUI.iconMd)    // 20.0
Icon(Icons.home, size: AppUI.iconLg)    // 24.0
Icon(Icons.home, size: AppUI.iconXl)    // 28.0
Icon(Icons.home, size: AppUI.iconXxl)   // 32.0
Icon(Icons.home, size: AppUI.iconHuge)  // 48.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Avatar Sizes
                buildExampleCard(
                  'Tamaños de Avatares',
                  'De 24px a 128px para diferentes contextos',
                  isNarrow,
                  Wrap(
                    spacing: isNarrow ? 16 : 24,
                    runSpacing: isNarrow ? 16 : 24,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _buildAvatarExample('XS', AppUI.avatarXs),
                      _buildAvatarExample('SM', AppUI.avatarSm),
                      _buildAvatarExample('MD', AppUI.avatarMd),
                      _buildAvatarExample('LG', AppUI.avatarLg),
                      _buildAvatarExample('XL', AppUI.avatarXl),
                      _buildAvatarExample('XXL', AppUI.avatarXxl),
                    ],
                  ),
                  '''// Tamaños de avatares
CircleAvatar(radius: AppUI.avatarXs)   // 24.0
CircleAvatar(radius: AppUI.avatarSm)   // 32.0
CircleAvatar(radius: AppUI.avatarMd)   // 40.0
CircleAvatar(radius: AppUI.avatarLg)   // 48.0
CircleAvatar(radius: AppUI.avatarXl)   // 64.0
CircleAvatar(radius: AppUI.avatarXxl)  // 128.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Elevations
                buildExampleCard(
                  'Elevaciones Material',
                  'De 0 a 24 siguiendo especificaciones de Material Design',
                  isNarrow,
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: text,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('None', AppUI.elevationNone),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('XS', AppUI.elevationXs),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('SM', AppUI.elevationSm),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('MD', AppUI.elevationMd),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('LG', AppUI.elevationLg),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('XL', AppUI.elevationXl),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('XXL', AppUI.elevationXxl),
                        ),
                        SizedBox(
                          width: isNarrow ? 110 : 140,
                          height: 100,
                          child: _buildElevationCard('Huge', AppUI.elevationHuge),
                        ),
                      ],
                    ),
                  ),
                  '''// Elevaciones Material
Card(elevation: AppUI.elevationNone)  // 0.0
Card(elevation: AppUI.elevationXs)    // 1.0
Card(elevation: AppUI.elevationSm)    // 2.0
Card(elevation: AppUI.elevationMd)    // 4.0
Card(elevation: AppUI.elevationLg)    // 6.0
Card(elevation: AppUI.elevationXl)    // 8.0
Card(elevation: AppUI.elevationXxl)   // 12.0
Card(elevation: AppUI.elevationHuge)  // 24.0''',
                ),

                SizedBox(height: isNarrow ? 24 : 32),

                // Opacities
                buildExampleCard(
                  'Opacidades Material',
                  'Niveles de transparencia para estados y jerarquía',
                  isNarrow,
                  Column(
                    children: [
                      _buildOpacityBar('Hover', '0.12', AppUI.opacityHover),
                      _buildOpacityBar(
                        'Disabled',
                        '0.38',
                        AppUI.opacityDisabled,
                      ),
                      _buildOpacityBar('Medium', '0.54', AppUI.opacityMedium),
                      _buildOpacityBar(
                        'Medium High',
                        '0.70',
                        AppUI.opacityMediumHigh,
                      ),
                      _buildOpacityBar('High', '0.87', AppUI.opacityHigh),
                      _buildOpacityBar('Full', '1.0', AppUI.opacityFull),
                    ],
                  ),
                  '''// Opacidades para estados
Opacity(
  opacity: AppUI.opacityHover,      // 0.12
  child: widget,
)
Opacity(
  opacity: AppUI.opacityDisabled,   // 0.38
  child: Text('Deshabilitado'),
)
Opacity(
  opacity: AppUI.opacityHigh,       // 0.87
  child: Text('Alto contraste'),
)''',
                ),

                SizedBox(height: isNarrow ? 48 : 64),

                // Best Practices
                buildPracticeCard(
                  'Mejores Prácticas',
                  [
                    'Usa tamaños de iconos consistentes: iconMd (20px) para la mayoría',
                    'Los avatares deben ser circulares con CircleAvatar',
                    'Elevaciones bajas (2-4) para elementos cercanos, altas (8-24) para modales',
                    'Las opacidades ayudan a crear jerarquía visual',
                    'Sigue las guías de Material Design para accesibilidad',
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

  Widget _buildIconExample(String label, double size, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: size, color: Colors.amber),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: text, fontSize: AppFontSizesConstants.bodySmall)),
        Text(
          '${size.toInt()}px',
          style: TextStyle(
            color: primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarExample(String label, double radius) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: radius / 2,
          backgroundColor: primary,
          child: Text(
            label[0],
            style: TextStyle(
              fontSize: (radius / 3).clamp(8, 20),
              color: bgDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: text, fontSize: 12)),
        Text(
          '${radius.toInt()}px',
          style: TextStyle(
            color: primary,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  Widget _buildElevationCard(String label, double elevation) {
    return Container(
      decoration: BoxDecoration(
        color: text,
        borderRadius: BorderRadius.circular(8),
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: elevation,
                  offset: Offset(0, elevation / 2),
                ),
              ]
            : null,
        border: Border.all(color: border.withValues(alpha: 0.3)),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: bgDark,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            elevation.toString(),
            style: TextStyle(
              color: bgLight,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpacityBar(String label, String value, double opacity) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(color: text, fontSize: 13)),
          ),
          SizedBox(
            width: 50,
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'monospace',
                color: primary,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: primary.withValues(alpha: opacity),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: border.withValues(alpha: 0.3)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
