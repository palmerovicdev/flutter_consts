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
/// - [AppFontSizes] - Sistema de tipografía jerárquica con escalas configurables
/// - [AppUI] - Acceso rápido a constantes comunes
library constants;

import 'package:consts/constants/app_font_sizes.dart';

import 'app_durations.dart';
import 'app_radius.dart';
import 'app_sizes.dart';
import 'app_spacing.dart';

export 'app_durations.dart';
export 'app_font_sizes.dart';
export 'app_radius.dart';
export 'app_sizes.dart';
export 'app_spacing.dart';
export 'app_ui.dart';

/// Punto de acceso central para todas las constantes de diseño
///
/// **Uso:**
/// ```dart
/// // Duraciones
/// Consts.durations.base.md  // 300ms
/// Consts.durations.feat.searchDebounce  // 300ms
/// ```
class Consts {
  Consts._();

  /// Sistema de duraciones para animaciones y transiciones
  ///
  /// **Uso:**
  /// ```dart
  /// // Duraciones base
  /// AnimatedContainer(
  ///   duration: Consts.durations.base.md,  // 300ms
  ///   child: Widget(),
  /// )
  ///
  /// // Duraciones específicas de features
  /// Timer(Consts.durations.feat.searchDebounce, callback);
  /// ```
  static AppDurationsSystem get durations => AppDurationsSystem();

  /// Sistema de tamaños de fuente tipográficos jerárquicos
  ///
  /// **Uso:**
  /// ```dart
  /// // Tamaños por categoría
  /// Text(
  ///   'Título',
  ///   style: TextStyle(fontSize: Consts.fontSizes.display.lg),  // 57.0
  /// )
  ///
  /// Text(
  ///   'Subtítulo',
  ///   style: TextStyle(fontSize: Consts.fontSizes.headline.md),  // 28.0
  /// )
  ///
  /// Text(
  ///   'Cuerpo',
  ///   style: TextStyle(fontSize: Consts.fontSizes.body.md),  // 14.0
  /// )
  ///
  /// // Tamaños especiales
  /// Text(
  ///   'Etiqueta',
  ///   style: TextStyle(fontSize: Consts.fontSizes.label.lg),  // 14.0
  /// )
  /// ```
  static FontSizesSystem get fontSizes => FontSizesSystem();

  /// Sistema de radius para bordes redondeados y formas
  ///
  /// **Uso:**
  /// ```dart
  /// // Valores base (double)
  /// double radiusValue = Consts.radius.base.md;  // 12.0
  ///
  /// // BorderRadius para contenedores
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: Consts.radius.containers.lg,  // BorderRadius.circular(16.0)
  ///   ),
  /// )
  ///
  /// // Radius individuales para esquinas específicas
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: BorderRadius.only(
  ///       topLeft: Consts.radius.corners.md,
  ///       topRight: Consts.radius.corners.lg,
  ///     ),
  ///   ),
  /// )
  ///
  /// // RoundedRectangleBorder para shapes
  /// Card(
  ///   shape: Consts.radius.shapes.md,
  /// )
  ///
  /// // Métodos helper para radius parciales
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: Consts.radius.partial.onlyTop(16.0),
  ///   ),
  /// )
  ///
  /// // Radius pre-configurados
  /// showModalBottomSheet(
  ///   shape: RoundedRectangleBorder(
  ///     borderRadius: Consts.radius.only.top.rightXl,
  ///   ),
  /// )
  /// ```
  static AppRadiusSystem get radius => AppRadiusSystem();

  /// Sistema de tamaños base para toda la aplicación
  ///
  /// **Uso:**
  /// ```dart
  /// // Tamaños base
  /// Container(
  ///   width: Consts.sizes.base.md,    // 12.0
  ///   height: Consts.sizes.base.lg,   // 16.0
  /// )
  ///
  /// // Iconos
  /// Icon(
  ///   Icons.home,
  ///   size: Consts.sizes.icons.lg,  // 24.0
  /// )
  ///
  /// // Avatares
  /// CircleAvatar(
  ///   radius: Consts.sizes.avatars.md,  // 40.0
  ///   child: Text('AB'),
  /// )
  ///
  /// // Breakpoints responsivos
  /// final width = MediaQuery.of(context).size.width;
  /// if (width < Consts.sizes.breakpoints.mobile) {
  ///   // Layout móvil (< 600px)
  /// } else if (width < Consts.sizes.breakpoints.tablet) {
  ///   // Layout tablet (< 900px)
  /// } else {
  ///   // Layout desktop
  /// }
  ///
  /// // Elevaciones Material Design
  /// Card(
  ///   elevation: Consts.sizes.elevations.md,  // 4.0
  ///   child: ...,
  /// )
  ///
  /// // Opacidades Material Design
  /// Opacity(
  ///   opacity: Consts.sizes.opacities.disabled,  // 0.38
  ///   child: Text('Deshabilitado'),
  /// )
  ///
  /// // Aspect Ratios
  /// AspectRatio(
  ///   aspectRatio: Consts.sizes.aspectRatios.wide,  // 16:9
  ///   child: Image.network('url'),
  /// )
  /// ```
  static AppSizesSystem get sizes => AppSizesSystem();

  /// Sistema de espaciado para padding, margin y gaps
  ///
  /// **Uso:**
  /// ```dart
  /// // Valores base (double)
  /// double spacing = Consts.spacing.base.md;  // 12.0
  ///
  /// // Padding uniforme en todos los lados
  /// Padding(
  ///   padding: Consts.spacing.padding.lg,  // EdgeInsets.all(16.0)
  ///   child: Text('Contenido'),
  /// )
  ///
  /// // Padding horizontal
  /// Container(
  ///   padding: Consts.spacing.horizontal.lg,  // EdgeInsets.symmetric(horizontal: 16.0)
  ///   child: Row(children: [...]),
  /// )
  ///
  /// // Padding vertical
  /// Container(
  ///   padding: Consts.spacing.vertical.md,  // EdgeInsets.symmetric(vertical: 12.0)
  ///   child: Column(children: [...]),
  /// )
  ///
  /// // Gaps verticales (Column)
  /// Column(
  ///   children: [
  ///     Text('Item 1'),
  ///     Consts.spacing.gap.md,  // SizedBox(height: 12.0)
  ///     Text('Item 2'),
  ///     Consts.spacing.gap.lg,  // SizedBox(height: 16.0)
  ///     Text('Item 3'),
  ///   ],
  /// )
  ///
  /// // Gaps horizontales (Row)
  /// Row(
  ///   children: [
  ///     Icon(Icons.star),
  ///     Consts.spacing.gapHorizontal.sm,  // SizedBox(width: 6.0)
  ///     Text('5.0'),
  ///   ],
  /// )
  /// ```
  static AppSpacingSystem get spacing => AppSpacingSystem();
}


