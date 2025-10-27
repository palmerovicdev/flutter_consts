import 'package:flutter/material.dart';
import 'app_sizes.dart';

/// Sistema de border radius para mantener consistencia visual en bordes redondeados
///
/// [AppRadius] proporciona una escala unificada de redondez basada en [AppSizes],
/// con múltiples formatos listos para usar en diferentes contextos de Flutter.
/// Esto garantiza coherencia visual y facilita el diseño de interfaces modernas.
///
/// ### 📦 Formatos Disponibles
///
/// 1. **Valores base** (double) - Para usar con `BorderRadius.circular()`
/// 2. **BorderRadius** - Listo para `BoxDecoration.borderRadius`
/// 3. **Radius** - Para esquinas individuales con `BorderRadius.only()`
/// 4. **RoundedRectangleBorder** - Para `shape` en botones y cards
/// 5. **Bordes parciales** - Top, bottom, left, right
///
/// ### 📏 Escala de Radius
///
/// La escala completa (basada en [AppSizes]):
/// - `none` (0.0) → Esquinas cuadradas
/// - `xxs` (2.0) → Mínimo redondeo
/// - `xs` (4.0) → Extra pequeño
/// - `sm` (6.0) → Pequeño (chips, tags)
/// - `smd` (8.0) → Pequeño-mediano (botones pequeños)
/// - `mds` (10.0) → Mediano-pequeño
/// - `md` (12.0) → Mediano ⭐ (estándar componentes)
/// - `mdl` (14.0) → Mediano-grande
/// - `lg` (16.0) → Grande (cards importantes)
/// - `lgx` (18.0) → Grande-extra
/// - `xl` (20.0) → Extra grande
/// - `xxl` (24.0) → Extra extra grande
/// - `xxxl` (28.0) → Triple extra grande
/// - `huge` (32.0) → Enorme
/// - `massive` (40.0) → Masivo
/// - `giant` (48.0) → Gigante
/// - `circular` (999.0) → Completamente circular (pill)
///
/// ### 🎨 Uso Básico
///
/// ```dart
/// // ✅ Valores base (double) - Con BorderRadius.circular()
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.blue,
///     borderRadius: BorderRadius.circular(AppRadius.md),  // 12.0
///   ),
/// )
///
/// // ✅ BorderRadius - Directo en BoxDecoration
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.blue,
///     borderRadius: AppRadius.borderLg,  // BorderRadius.circular(16.0)
///   ),
/// )
///
/// // ✅ Radius - Para esquinas individuales
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: AppRadius.radiusMd,     // Radius.circular(12.0)
///       topRight: AppRadius.radiusLg,    // Radius.circular(16.0)
///     ),
///   ),
/// )
///
/// // ✅ RoundedRectangleBorder - Para botones
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: AppRadius.shapeMd,  // RoundedRectangleBorder
///   ),
///   child: Text('Botón'),
/// )
///
/// // ✅ Card con shape
/// Card(
///   shape: AppRadius.shapeLg,  // RoundedRectangleBorder
///   child: Content(),
/// )
///
/// // ✅ Bordes parciales - Solo arriba
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadius.borderTopLg,  // Solo esquinas superiores
///   ),
/// )
///
/// // ✅ Botón circular (pill)
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: AppRadius.shapeCircular,  // Completamente circular
///   ),
///   child: Text('Pill Button'),
/// )
/// ```
///
/// ### 📱 Patrones Comunes por Componente
///
/// **Botones:**
/// ```dart
/// // Botón estándar
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: AppRadius.shapeMd,  // 12.0 - Redondez moderada
///   ),
/// )
///
/// // Botón pill
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: AppRadius.shapeCircular,  // Completamente circular
///   ),
/// )
/// ```
///
/// **Cards:**
/// ```dart
/// // Card estándar
/// Card(
///   shape: AppRadius.shapeMd,  // 12.0 - Coherente con Material
///   child: Content(),
/// )
///
/// // Card destacada
/// Card(
///   shape: AppRadius.shapeLg,  // 16.0 - Más suave y moderna
///   child: Content(),
/// )
/// ```
///
/// **Inputs:**
/// ```dart
/// TextField(
///   decoration: InputDecoration(
///     border: OutlineInputBorder(
///       borderRadius: AppRadius.borderSmd,  // 8.0 - Sutil
///     ),
///   ),
/// )
/// ```
///
/// **Bottom Sheets:**
/// ```dart
/// // Solo esquinas superiores redondeadas
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.white,
///     borderRadius: AppRadius.borderTopLg,  // Solo arriba
///   ),
/// )
/// ```
///
/// **Imágenes:**
/// ```dart
/// ClipRRect(
///   borderRadius: AppRadius.borderMd,  // 12.0
///   child: Image.network('url'),
/// )
/// ```
///
/// **Chips y Tags:**
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadius.borderSm,  // 6.0 - Compacto
///   ),
/// )
/// ```
///
/// ### 🎯 Guía de Selección
///
/// **Por Tamaño del Componente:**
/// - Elementos pequeños (< 40px) → `xs` a `sm` (4-6)
/// - Elementos medianos (40-80px) → `smd` a `md` (8-12) ⭐
/// - Elementos grandes (80-150px) → `lg` a `xl` (16-20)
/// - Elementos muy grandes (> 150px) → `xxl` a `huge` (24-32)
///
/// **Por Propósito:**
/// - Botones estándar → `md` (12.0)
/// - Botones pill → `circular` (999.0)
/// - Cards → `md` a `lg` (12-16)
/// - Inputs → `smd` a `md` (8-12)
/// - Modals → `lg` a `xl` (16-20)
/// - Images → `md` a `lg` (12-16)
/// - Chips/tags → `sm` a `smd` (6-8)
///
/// **Por Estilo:**
/// - Minimalista/corporativo → `xs` a `sm` (4-6)
/// - Moderno/estándar → `md` a `lg` (12-16) ⭐
/// - Amigable/casual → `lg` a `xxl` (16-24)
/// - Juguetón → `xxl` a `huge` (24-32)
///
/// ### 💡 Recomendaciones
///
/// 1. **Consistencia**: Usa la misma redondez para componentes similares
/// 2. **Proporción**: El radius debe ser proporcional al tamaño del elemento
/// 3. **No exageres**: Demasiada redondez puede verse poco profesional
/// 4. **Material Design**: `md` (12.0) es el estándar de Material 3
/// 5. **Accesibilidad**: Los bordes redondeados mejoran la jerarquía visual
/// 6. **Performance**: Los bordes muy redondeados pueden afectar rendimiento
///
/// ### ❌ Evitar
///
/// ```dart
/// // ❌ NO uses valores arbitrarios
/// BorderRadius.circular(13.7)
/// Radius.circular(17.3)
///
/// // ✅ USA la escala predefinida
/// AppRadius.borderMd      // BorderRadius.circular(12.0)
/// AppRadius.radiusLg      // Radius.circular(16.0)
///
/// // ❌ NO mezcles estilos inconsistentes
/// Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))
/// ElevatedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)))
///
/// // ✅ USA escalas consistentes
/// Card(shape: AppRadius.shapeMd)          // 12.0
/// ElevatedButton(shape: AppRadius.shapeMd) // 12.0
/// ```
///
/// ### 🔗 Ver también
///
/// - [AppSizes] para la escala base de tamaños
/// - [AppSpacing] para espaciado consistente
/// - [Material Design - Shape](https://material.io/design/shape)
///
/// ### 📚 Referencias
///
/// - [Material Design 3 - Shape](https://m3.material.io/styles/shape/overview)
/// - [Flutter - BorderRadius](https://api.flutter.dev/flutter/painting/BorderRadius-class.html)
/// - [Flutter - RoundedRectangleBorder](https://api.flutter.dev/flutter/painting/RoundedRectangleBorder-class.html)
class AppRadius {
  AppRadius._();

  // Valores base de radius
  /// Sin radio (esquinas cuadradas) - 0.0
  static const double none = AppSizes.none;

  /// Extra extra pequeño - 2.0
  static const double xxs = AppSizes.xxs;

  /// Extra pequeño - 4.0
  /// Ideal para elementos muy sutiles
  static const double xs = AppSizes.xs;

  /// Pequeño - 6.0
  /// Bueno para chips y tags pequeños
  static const double sm = AppSizes.sm;

  /// Pequeño-mediano - 8.0
  /// Común en botones pequeños
  static const double smd = AppSizes.smd;

  /// Mediano-pequeño - 10.0
  static const double mds = AppSizes.mds;

  /// Mediano - 12.0
  /// Valor estándar para la mayoría de componentes
  static const double md = AppSizes.md;

  /// Mediano-grande - 14.0
  static const double mdl = AppSizes.mdl;

  /// Grande - 16.0
  /// Bueno para cards y containers importantes
  static const double lg = AppSizes.lg;

  /// Grande-extra - 18.0
  static const double lgx = AppSizes.lgx;

  /// Extra grande - 20.0
  /// Para elementos destacados
  static const double xl = AppSizes.xl;

  /// Extra extra grande - 24.0
  static const double xxl = AppSizes.xxl;

  /// Extra extra extra grande - 28.0
  static const double xxxl = AppSizes.xxxl;

  /// Enorme - 32.0
  static const double huge = AppSizes.huge;

  /// Masivo - 40.0
  static const double massive = AppSizes.massive;

  /// Gigante - 48.0
  static const double giant = AppSizes.giant;

  /// Completamente circular (pill shape) - 999.0
  /// Para botones tipo "pill" o elementos circulares
  static const double circular = 999.0;

  // BorderRadius getters - Para Container decoration
  /// Sin radio - 0.0
  static BorderRadius get borderNone => BorderRadius.zero;

  /// Extra extra pequeño - 2.0
  static BorderRadius get borderXxs => BorderRadius.circular(xxs);

  /// Extra pequeño - 4.0
  /// Ideal para elementos muy sutiles
  static BorderRadius get borderXs => BorderRadius.circular(xs);

  /// Pequeño - 6.0
  /// Bueno para chips y tags pequeños
  static BorderRadius get borderSm => BorderRadius.circular(sm);

  /// Pequeño-mediano - 8.0
  /// Común en botones pequeños
  static BorderRadius get borderSmd => BorderRadius.circular(smd);

  /// Mediano-pequeño - 10.0
  static BorderRadius get borderMds => BorderRadius.circular(mds);

  /// Mediano - 12.0
  /// Valor estándar para la mayoría de componentes
  static BorderRadius get borderMd => BorderRadius.circular(md);

  /// Mediano-grande - 14.0
  static BorderRadius get borderMdl => BorderRadius.circular(mdl);

  /// Grande - 16.0
  /// Bueno para cards y containers importantes
  static BorderRadius get borderLg => BorderRadius.circular(lg);

  /// Grande-extra - 18.0
  static BorderRadius get borderLgx => BorderRadius.circular(lgx);

  /// Extra grande - 20.0
  /// Para elementos destacados
  static BorderRadius get borderXl => BorderRadius.circular(xl);

  /// Extra extra grande - 24.0
  static BorderRadius get borderXxl => BorderRadius.circular(xxl);

  /// Extra extra extra grande - 28.0
  static BorderRadius get borderXxxl => BorderRadius.circular(xxxl);

  /// Enorme - 32.0
  static BorderRadius get borderHuge => BorderRadius.circular(huge);

  /// Masivo - 40.0
  static BorderRadius get borderMassive => BorderRadius.circular(massive);

  /// Gigante - 48.0
  static BorderRadius get borderGiant => BorderRadius.circular(giant);

  /// Completamente circular - 999.0
  /// Para botones tipo "pill" o elementos circulares
  static BorderRadius get borderCircular => BorderRadius.circular(circular);

  // Radius getters - Para esquinas individuales
  /// Sin radio - 0.0
  static Radius get radiusNone => Radius.zero;

  /// Extra extra pequeño - 2.0
  static Radius get radiusXxs => Radius.circular(xxs);

  /// Extra pequeño - 4.0
  static Radius get radiusXs => Radius.circular(xs);

  /// Pequeño - 6.0
  static Radius get radiusSm => Radius.circular(sm);

  /// Pequeño-mediano - 8.0
  static Radius get radiusSmd => Radius.circular(smd);

  /// Mediano-pequeño - 10.0
  static Radius get radiusMds => Radius.circular(mds);

  /// Mediano - 12.0
  static Radius get radiusMd => Radius.circular(md);

  /// Mediano-grande - 14.0
  static Radius get radiusMdl => Radius.circular(mdl);

  /// Grande - 16.0
  static Radius get radiusLg => Radius.circular(lg);

  /// Grande-extra - 18.0
  static Radius get radiusLgx => Radius.circular(lgx);

  /// Extra grande - 20.0
  static Radius get radiusXl => Radius.circular(xl);

  /// Extra extra grande - 24.0
  static Radius get radiusXxl => Radius.circular(xxl);

  /// Extra extra extra grande - 28.0
  static Radius get radiusXxxl => Radius.circular(xxxl);

  /// Enorme - 32.0
  static Radius get radiusHuge => Radius.circular(huge);

  /// Masivo - 40.0
  static Radius get radiusMassive => Radius.circular(massive);

  /// Gigante - 48.0
  static Radius get radiusGiant => Radius.circular(giant);

  /// Completamente circular - 999.0
  static Radius get radiusCircular => Radius.circular(circular);

  // RoundedRectangleBorder - Para botones y cards
  /// Sin radio - 0.0
  static RoundedRectangleBorder get shapeNone =>
      RoundedRectangleBorder(borderRadius: borderNone);

  /// Extra extra pequeño - 2.0
  static RoundedRectangleBorder get shapeXxs =>
      RoundedRectangleBorder(borderRadius: borderXxs);

  /// Extra pequeño - 4.0
  static RoundedRectangleBorder get shapeXs =>
      RoundedRectangleBorder(borderRadius: borderXs);

  /// Pequeño - 6.0
  static RoundedRectangleBorder get shapeSm =>
      RoundedRectangleBorder(borderRadius: borderSm);

  /// Pequeño-mediano - 8.0
  static RoundedRectangleBorder get shapeSmd =>
      RoundedRectangleBorder(borderRadius: borderSmd);

  /// Mediano-pequeño - 10.0
  static RoundedRectangleBorder get shapeMds =>
      RoundedRectangleBorder(borderRadius: borderMds);

  /// Mediano - 12.0
  static RoundedRectangleBorder get shapeMd =>
      RoundedRectangleBorder(borderRadius: borderMd);

  /// Mediano-grande - 14.0
  static RoundedRectangleBorder get shapeMdl =>
      RoundedRectangleBorder(borderRadius: borderMdl);

  /// Grande - 16.0
  static RoundedRectangleBorder get shapeLg =>
      RoundedRectangleBorder(borderRadius: borderLg);

  /// Grande-extra - 18.0
  static RoundedRectangleBorder get shapeLgx =>
      RoundedRectangleBorder(borderRadius: borderLgx);

  /// Extra grande - 20.0
  static RoundedRectangleBorder get shapeXl =>
      RoundedRectangleBorder(borderRadius: borderXl);

  /// Extra extra grande - 24.0
  static RoundedRectangleBorder get shapeXxl =>
      RoundedRectangleBorder(borderRadius: borderXxl);

  /// Extra extra extra grande - 28.0
  static RoundedRectangleBorder get shapeXxxl =>
      RoundedRectangleBorder(borderRadius: borderXxxl);

  /// Enorme - 32.0
  static RoundedRectangleBorder get shapeHuge =>
      RoundedRectangleBorder(borderRadius: borderHuge);

  /// Masivo - 40.0
  static RoundedRectangleBorder get shapeMassive =>
      RoundedRectangleBorder(borderRadius: borderMassive);

  /// Gigante - 48.0
  static RoundedRectangleBorder get shapeGiant =>
      RoundedRectangleBorder(borderRadius: borderGiant);

  /// Forma circular - 999.0
  static RoundedRectangleBorder get shapeCircular =>
      RoundedRectangleBorder(borderRadius: borderCircular);

  // BorderRadius.only() - Top corners
  /// Esquinas superiores redondeadas - 4.0
  static BorderRadius get borderTopXs =>
      BorderRadius.only(topLeft: radiusXs, topRight: radiusXs);

  /// Esquinas superiores redondeadas - 6.0
  static BorderRadius get borderTopSm =>
      BorderRadius.only(topLeft: radiusSm, topRight: radiusSm);

  /// Esquinas superiores redondeadas - 8.0
  static BorderRadius get borderTopSmd =>
      BorderRadius.only(topLeft: radiusSmd, topRight: radiusSmd);

  /// Esquinas superiores redondeadas - 12.0
  static BorderRadius get borderTopMd =>
      BorderRadius.only(topLeft: radiusMd, topRight: radiusMd);

  /// Esquinas superiores redondeadas - 16.0
  static BorderRadius get borderTopLg =>
      BorderRadius.only(topLeft: radiusLg, topRight: radiusLg);

  /// Esquinas superiores redondeadas - 20.0
  static BorderRadius get borderTopXl =>
      BorderRadius.only(topLeft: radiusXl, topRight: radiusXl);

  /// Esquinas superiores redondeadas - 24.0
  static BorderRadius get borderTopXxl =>
      BorderRadius.only(topLeft: radiusXxl, topRight: radiusXxl);

  /// Esquinas superiores redondeadas - 32.0
  static BorderRadius get borderTopHuge =>
      BorderRadius.only(topLeft: radiusHuge, topRight: radiusHuge);

  // BorderRadius.only() - Bottom corners
  /// Esquinas inferiores redondeadas - 4.0
  static BorderRadius get borderBottomXs =>
      BorderRadius.only(bottomLeft: radiusXs, bottomRight: radiusXs);

  /// Esquinas inferiores redondeadas - 6.0
  static BorderRadius get borderBottomSm =>
      BorderRadius.only(bottomLeft: radiusSm, bottomRight: radiusSm);

  /// Esquinas inferiores redondeadas - 8.0
  static BorderRadius get borderBottomSmd =>
      BorderRadius.only(bottomLeft: radiusSmd, bottomRight: radiusSmd);

  /// Esquinas inferiores redondeadas - 12.0
  static BorderRadius get borderBottomMd =>
      BorderRadius.only(bottomLeft: radiusMd, bottomRight: radiusMd);

  /// Esquinas inferiores redondeadas - 16.0
  static BorderRadius get borderBottomLg =>
      BorderRadius.only(bottomLeft: radiusLg, bottomRight: radiusLg);

  /// Esquinas inferiores redondeadas - 20.0
  static BorderRadius get borderBottomXl =>
      BorderRadius.only(bottomLeft: radiusXl, bottomRight: radiusXl);

  /// Esquinas inferiores redondeadas - 24.0
  static BorderRadius get borderBottomXxl =>
      BorderRadius.only(bottomLeft: radiusXxl, bottomRight: radiusXxl);

  /// Esquinas inferiores redondeadas - 32.0
  static BorderRadius get borderBottomHuge =>
      BorderRadius.only(bottomLeft: radiusHuge, bottomRight: radiusHuge);

  // BorderRadius.only() - Left corners
  /// Esquinas izquierdas redondeadas - 4.0
  static BorderRadius get borderLeftXs =>
      BorderRadius.only(topLeft: radiusXs, bottomLeft: radiusXs);

  /// Esquinas izquierdas redondeadas - 6.0
  static BorderRadius get borderLeftSm =>
      BorderRadius.only(topLeft: radiusSm, bottomLeft: radiusSm);

  /// Esquinas izquierdas redondeadas - 8.0
  static BorderRadius get borderLeftSmd =>
      BorderRadius.only(topLeft: radiusSmd, bottomLeft: radiusSmd);

  /// Esquinas izquierdas redondeadas - 12.0
  static BorderRadius get borderLeftMd =>
      BorderRadius.only(topLeft: radiusMd, bottomLeft: radiusMd);

  /// Esquinas izquierdas redondeadas - 16.0
  static BorderRadius get borderLeftLg =>
      BorderRadius.only(topLeft: radiusLg, bottomLeft: radiusLg);

  /// Esquinas izquierdas redondeadas - 20.0
  static BorderRadius get borderLeftXl =>
      BorderRadius.only(topLeft: radiusXl, bottomLeft: radiusXl);

  // BorderRadius.only() - Right corners
  /// Esquinas derechas redondeadas - 4.0
  static BorderRadius get borderRightXs =>
      BorderRadius.only(topRight: radiusXs, bottomRight: radiusXs);

  /// Esquinas derechas redondeadas - 6.0
  static BorderRadius get borderRightSm =>
      BorderRadius.only(topRight: radiusSm, bottomRight: radiusSm);

  /// Esquinas derechas redondeadas - 8.0
  static BorderRadius get borderRightSmd =>
      BorderRadius.only(topRight: radiusSmd, bottomRight: radiusSmd);

  /// Esquinas derechas redondeadas - 12.0
  static BorderRadius get borderRightMd =>
      BorderRadius.only(topRight: radiusMd, bottomRight: radiusMd);

  /// Esquinas derechas redondeadas - 16.0
  static BorderRadius get borderRightLg =>
      BorderRadius.only(topRight: radiusLg, bottomRight: radiusLg);

  /// Esquinas derechas redondeadas - 20.0
  static BorderRadius get borderRightXl =>
      BorderRadius.only(topRight: radiusXl, bottomRight: radiusXl);

  // Métodos dinámicos para bordes parciales con tamaño personalizado
  /// Crea un BorderRadius con solo las esquinas superiores redondeadas
  /// [radius] - El radio a aplicar en las esquinas superiores
  ///
  /// ```dart
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: AppRadius.onlyTop(16.0),
  ///   ),
  /// )
  /// ```
  static BorderRadius onlyTop(double radius) => BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      );

  /// Crea un BorderRadius con solo las esquinas inferiores redondeadas
  /// [radius] - El radio a aplicar en las esquinas inferiores
  ///
  /// ```dart
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: AppRadius.onlyBottom(16.0),
  ///   ),
  /// )
  /// ```
  static BorderRadius onlyBottom(double radius) => BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );

  /// Crea un BorderRadius con solo las esquinas izquierdas redondeadas
  /// [radius] - El radio a aplicar en las esquinas izquierdas
  ///
  /// ```dart
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: AppRadius.onlyLeft(16.0),
  ///   ),
  /// )
  /// ```
  static BorderRadius onlyLeft(double radius) => BorderRadius.only(
        topLeft: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
      );

  /// Crea un BorderRadius con solo las esquinas derechas redondeadas
  /// [radius] - El radio a aplicar en las esquinas derechas
  ///
  /// ```dart
  /// Container(
  ///   decoration: BoxDecoration(
  ///     borderRadius: AppRadius.onlyRight(16.0),
  ///   ),
  /// )
  /// ```
  static BorderRadius onlyRight(double radius) => BorderRadius.only(
        topRight: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );
}
