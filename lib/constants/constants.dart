/// Sistema de constantes de diseño para aplicaciones Flutter
///
/// Este archivo exporta todos los sistemas de diseño disponibles para
/// mantener consistencia visual en toda la aplicación.
///
/// **Instalación:**
/// ```yaml
/// dependencies:
///   flutter_const: ^1.0.0
/// ```
///
/// **Uso básico:**
/// ```dart
/// import 'package:flutter_const/constants/constants.dart';
///
/// // Usando tamaños
/// SizedBox(width: AppSizes.lg, height: AppSizes.md);
///
/// // Usando espaciado
/// Padding(
///   padding: AppSpacing.paddingLg,
///   child: Column(
///     children: [
///       Text('Título'),
///       AppSpacing.gapMd, // Gap entre widgets
///       Text('Descripción'),
///     ],
///   ),
/// );
///
/// // Usando radius
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadius.borderLg,
///   ),
/// );
///
/// // Usando duraciones
/// AnimatedContainer(
///   duration: AppDurations.md,
///   curve: Curves.easeInOut,
/// );
///
/// // Usando UI constants
/// Card(elevation: AppUI.elevationMd);
/// Icon(Icons.home, size: AppUI.iconLg);
/// ```
///
/// **Sistemas disponibles:**
/// - [AppSizes] - Tamaños base, iconos, avatares, elevaciones, opacidades
/// - [AppSpacing] - Espaciado, padding, gaps
/// - [AppRadius] - Border radius, shapes
/// - [AppDurations] - Duraciones de animaciones
/// - [AppUI] - Acceso rápido a constantes comunes
library constants;

export 'app_durations.dart';
export 'app_radius.dart';
export 'app_sizes.dart';
export 'app_spacing.dart';
export 'app_ui.dart';

