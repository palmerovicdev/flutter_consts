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
  static RoundedRectangleBorder get shapeNone => RoundedRectangleBorder(borderRadius: borderNone);

  /// Extra extra pequeño - 2.0
  static RoundedRectangleBorder get shapeXxs => RoundedRectangleBorder(borderRadius: borderXxs);

  /// Extra pequeño - 4.0
  static RoundedRectangleBorder get shapeXs => RoundedRectangleBorder(borderRadius: borderXs);

  /// Pequeño - 6.0
  static RoundedRectangleBorder get shapeSm => RoundedRectangleBorder(borderRadius: borderSm);

  /// Pequeño-mediano - 8.0
  static RoundedRectangleBorder get shapeSmd => RoundedRectangleBorder(borderRadius: borderSmd);

  /// Mediano-pequeño - 10.0
  static RoundedRectangleBorder get shapeMds => RoundedRectangleBorder(borderRadius: borderMds);

  /// Mediano - 12.0
  static RoundedRectangleBorder get shapeMd => RoundedRectangleBorder(borderRadius: borderMd);

  /// Mediano-grande - 14.0
  static RoundedRectangleBorder get shapeMdl => RoundedRectangleBorder(borderRadius: borderMdl);

  /// Grande - 16.0
  static RoundedRectangleBorder get shapeLg => RoundedRectangleBorder(borderRadius: borderLg);

  /// Grande-extra - 18.0
  static RoundedRectangleBorder get shapeLgx => RoundedRectangleBorder(borderRadius: borderLgx);

  /// Extra grande - 20.0
  static RoundedRectangleBorder get shapeXl => RoundedRectangleBorder(borderRadius: borderXl);

  /// Extra extra grande - 24.0
  static RoundedRectangleBorder get shapeXxl => RoundedRectangleBorder(borderRadius: borderXxl);

  /// Extra extra extra grande - 28.0
  static RoundedRectangleBorder get shapeXxxl => RoundedRectangleBorder(borderRadius: borderXxxl);

  /// Enorme - 32.0
  static RoundedRectangleBorder get shapeHuge => RoundedRectangleBorder(borderRadius: borderHuge);

  /// Masivo - 40.0
  static RoundedRectangleBorder get shapeMassive => RoundedRectangleBorder(borderRadius: borderMassive);

  /// Gigante - 48.0
  static RoundedRectangleBorder get shapeGiant => RoundedRectangleBorder(borderRadius: borderGiant);

  /// Forma circular - 999.0
  static RoundedRectangleBorder get shapeCircular => RoundedRectangleBorder(borderRadius: borderCircular);

  // BorderRadius.only() - Top corners
  /// Esquinas superiores redondeadas - 4.0
  static BorderRadius get borderTopXs => BorderRadius.only(topLeft: radiusXs, topRight: radiusXs);

  /// Esquinas superiores redondeadas - 6.0
  static BorderRadius get borderTopSm => BorderRadius.only(topLeft: radiusSm, topRight: radiusSm);

  /// Esquinas superiores redondeadas - 8.0
  static BorderRadius get borderTopSmd => BorderRadius.only(topLeft: radiusSmd, topRight: radiusSmd);

  /// Esquinas superiores redondeadas - 12.0
  static BorderRadius get borderTopMd => BorderRadius.only(topLeft: radiusMd, topRight: radiusMd);

  /// Esquinas superiores redondeadas - 16.0
  static BorderRadius get borderTopLg => BorderRadius.only(topLeft: radiusLg, topRight: radiusLg);

  /// Esquinas superiores redondeadas - 20.0
  static BorderRadius get borderTopXl => BorderRadius.only(topLeft: radiusXl, topRight: radiusXl);

  /// Esquinas superiores redondeadas - 24.0
  static BorderRadius get borderTopXxl => BorderRadius.only(topLeft: radiusXxl, topRight: radiusXxl);

  /// Esquinas superiores redondeadas - 32.0
  static BorderRadius get borderTopHuge => BorderRadius.only(topLeft: radiusHuge, topRight: radiusHuge);

  // BorderRadius.only() - Bottom corners
  /// Esquinas inferiores redondeadas - 4.0
  static BorderRadius get borderBottomXs => BorderRadius.only(bottomLeft: radiusXs, bottomRight: radiusXs);

  /// Esquinas inferiores redondeadas - 6.0
  static BorderRadius get borderBottomSm => BorderRadius.only(bottomLeft: radiusSm, bottomRight: radiusSm);

  /// Esquinas inferiores redondeadas - 8.0
  static BorderRadius get borderBottomSmd => BorderRadius.only(bottomLeft: radiusSmd, bottomRight: radiusSmd);

  /// Esquinas inferiores redondeadas - 12.0
  static BorderRadius get borderBottomMd => BorderRadius.only(bottomLeft: radiusMd, bottomRight: radiusMd);

  /// Esquinas inferiores redondeadas - 16.0
  static BorderRadius get borderBottomLg => BorderRadius.only(bottomLeft: radiusLg, bottomRight: radiusLg);

  /// Esquinas inferiores redondeadas - 20.0
  static BorderRadius get borderBottomXl => BorderRadius.only(bottomLeft: radiusXl, bottomRight: radiusXl);

  /// Esquinas inferiores redondeadas - 24.0
  static BorderRadius get borderBottomXxl => BorderRadius.only(bottomLeft: radiusXxl, bottomRight: radiusXxl);

  /// Esquinas inferiores redondeadas - 32.0
  static BorderRadius get borderBottomHuge => BorderRadius.only(bottomLeft: radiusHuge, bottomRight: radiusHuge);

  // BorderRadius.only() - Left corners
  /// Esquinas izquierdas redondeadas - 4.0
  static BorderRadius get borderLeftXs => BorderRadius.only(topLeft: radiusXs, bottomLeft: radiusXs);

  /// Esquinas izquierdas redondeadas - 6.0
  static BorderRadius get borderLeftSm => BorderRadius.only(topLeft: radiusSm, bottomLeft: radiusSm);

  /// Esquinas izquierdas redondeadas - 8.0
  static BorderRadius get borderLeftSmd => BorderRadius.only(topLeft: radiusSmd, bottomLeft: radiusSmd);

  /// Esquinas izquierdas redondeadas - 12.0
  static BorderRadius get borderLeftMd => BorderRadius.only(topLeft: radiusMd, bottomLeft: radiusMd);

  /// Esquinas izquierdas redondeadas - 16.0
  static BorderRadius get borderLeftLg => BorderRadius.only(topLeft: radiusLg, bottomLeft: radiusLg);

  /// Esquinas izquierdas redondeadas - 20.0
  static BorderRadius get borderLeftXl => BorderRadius.only(topLeft: radiusXl, bottomLeft: radiusXl);

  // BorderRadius.only() - Right corners
  /// Esquinas derechas redondeadas - 4.0
  static BorderRadius get borderRightXs => BorderRadius.only(topRight: radiusXs, bottomRight: radiusXs);

  /// Esquinas derechas redondeadas - 6.0
  static BorderRadius get borderRightSm => BorderRadius.only(topRight: radiusSm, bottomRight: radiusSm);

  /// Esquinas derechas redondeadas - 8.0
  static BorderRadius get borderRightSmd => BorderRadius.only(topRight: radiusSmd, bottomRight: radiusSmd);

  /// Esquinas derechas redondeadas - 12.0
  static BorderRadius get borderRightMd => BorderRadius.only(topRight: radiusMd, bottomRight: radiusMd);

  /// Esquinas derechas redondeadas - 16.0
  static BorderRadius get borderRightLg => BorderRadius.only(topRight: radiusLg, bottomRight: radiusLg);

  /// Esquinas derechas redondeadas - 20.0
  static BorderRadius get borderRightXl => BorderRadius.only(topRight: radiusXl, bottomRight: radiusXl);

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

/// Valores base de radius como `double`
///
/// Esta clase proporciona acceso a los valores numéricos base de los radius
/// para usar con `BorderRadius.circular()` u otros constructores personalizados.
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ Usando con BorderRadius.circular()
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(AppRadiusBase._().md),  // 12.0
///   ),
/// )
///
/// // ✅ Usando con BoxDecoration directamente
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.all(Radius.circular(AppRadiusBase._().lg)),  // 16.0
///   ),
/// )
///
/// // 💡 Alternativa recomendada: usar AppRadius directamente
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadius.borderMd,  // Más simple
///   ),
/// )
/// ```
///
/// ### 📏 Valores disponibles
///
/// - `none` (0.0) → Sin redondeo
/// - `xxs` (2.0) → Extra extra pequeño
/// - `xs` (4.0) → Extra pequeño
/// - `sm` (6.0) → Pequeño
/// - `smd` (8.0) → Pequeño-mediano
/// - `mds` (10.0) → Mediano-pequeño
/// - `md` (12.0) → Mediano ⭐ (estándar)
/// - `mdl` (14.0) → Mediano-grande
/// - `lg` (16.0) → Grande
/// - `lgx` (18.0) → Grande-extra
/// - `xl` (20.0) → Extra grande
/// - `xxl` (24.0) → Extra extra grande
/// - `xxxl` (28.0) → Triple extra grande
/// - `huge` (32.0) → Enorme
/// - `massive` (40.0) → Masivo
/// - `giant` (48.0) → Gigante
/// - `circular` (999.0) → Completamente circular
///
/// ### 💡 Ver también
///
/// - [AppRadius] para acceso estático directo
/// - [AppRadiusContainers] para BorderRadius listos
/// - [AppRadiusSystem] para acceso mediante sistema jerárquico
class AppRadiusBase {
  const AppRadiusBase._();

  /// Sin radio (esquinas cuadradas) - 0.0
  double get none => AppSizes.none;

  /// Extra extra pequeño - 2.0
  double get xxs => AppSizes.xxs;

  /// Extra pequeño - 4.0
  double get xs => AppSizes.xs;

  /// Pequeño - 6.0
  double get sm => AppSizes.sm;

  /// Pequeño-mediano - 8.0
  double get smd => AppSizes.smd;

  /// Mediano-pequeño - 10.0
  double get mds => AppSizes.mds;

  /// Mediano - 12.0 (estándar)
  double get md => AppSizes.md;

  /// Mediano-grande - 14.0
  double get mdl => AppSizes.mdl;

  /// Grande - 16.0
  double get lg => AppSizes.lg;

  /// Grande-extra - 18.0
  double get lgx => AppSizes.lgx;

  /// Extra grande - 20.0
  double get xl => AppSizes.xl;

  /// Extra extra grande - 24.0
  double get xxl => AppSizes.xxl;

  /// Extra extra extra grande - 28.0
  double get xxxl => AppSizes.xxxl;

  /// Enorme - 32.0
  double get huge => AppSizes.huge;

  /// Masivo - 40.0
  double get massive => AppSizes.massive;

  /// Gigante - 48.0
  double get giant => AppSizes.giant;

  /// Completamente circular - 999.0
  double get circular => 999.0;
}

/// BorderRadius listos para usar en decoraciones de contenedores
///
/// Esta clase proporciona instancias pre-configuradas de [BorderRadius]
/// listas para usar directamente en `BoxDecoration.borderRadius`, eliminando
/// la necesidad de llamar a `BorderRadius.circular()` manualmente.
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ Uso directo en Container
/// Container(
///   decoration: BoxDecoration(
///     color: Colors.blue,
///     borderRadius: AppRadiusContainers._().md,  // BorderRadius.circular(12.0)
///   ),
/// )
///
/// // ✅ Con ClipRRect para imágenes
/// ClipRRect(
///   borderRadius: AppRadiusContainers._().lg,  // BorderRadius.circular(16.0)
///   child: Image.network('url'),
/// )
///
/// // 💡 Alternativa recomendada: usar AppRadius directamente
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadius.borderMd,  // Más conveniente
///   ),
/// )
/// ```
///
/// ### 📦 Valores disponibles
///
/// Todos los tamaños de la escala estándar:
/// - `none` → BorderRadius.zero
/// - `xxs` → BorderRadius.circular(2.0)
/// - `xs` → BorderRadius.circular(4.0)
/// - `sm` → BorderRadius.circular(6.0)
/// - `smd` → BorderRadius.circular(8.0)
/// - `mds` → BorderRadius.circular(10.0)
/// - `md` → BorderRadius.circular(12.0) ⭐
/// - `mdl` → BorderRadius.circular(14.0)
/// - `lg` → BorderRadius.circular(16.0)
/// - `lgx` → BorderRadius.circular(18.0)
/// - `xl` → BorderRadius.circular(20.0)
/// - `xxl` → BorderRadius.circular(24.0)
/// - `xxxl` → BorderRadius.circular(28.0)
/// - `huge` → BorderRadius.circular(32.0)
/// - `massive` → BorderRadius.circular(40.0)
/// - `giant` → BorderRadius.circular(48.0)
/// - `circular` → BorderRadius.circular(999.0)
///
/// ### 💡 Ver también
///
/// - [AppRadius] para acceso estático directo
/// - [AppRadiusCorners] para Radius individuales
/// - [AppRadiusShapes] para RoundedRectangleBorder
class AppRadiusContainers {
  const AppRadiusContainers._();

  /// Sin radio - BorderRadius.zero
  BorderRadius get none => BorderRadius.zero;

  /// Extra extra pequeño - 2.0
  BorderRadius get xxs => BorderRadius.circular(AppSizes.xxs);

  /// Extra pequeño - 4.0
  BorderRadius get xs => BorderRadius.circular(AppSizes.xs);

  /// Pequeño - 6.0
  BorderRadius get sm => BorderRadius.circular(AppSizes.sm);

  /// Pequeño-mediano - 8.0
  BorderRadius get smd => BorderRadius.circular(AppSizes.smd);

  /// Mediano-pequeño - 10.0
  BorderRadius get mds => BorderRadius.circular(AppSizes.mds);

  /// Mediano - 12.0 (estándar)
  BorderRadius get md => BorderRadius.circular(AppSizes.md);

  /// Mediano-grande - 14.0
  BorderRadius get mdl => BorderRadius.circular(AppSizes.mdl);

  /// Grande - 16.0
  BorderRadius get lg => BorderRadius.circular(AppSizes.lg);

  /// Grande-extra - 18.0
  BorderRadius get lgx => BorderRadius.circular(AppSizes.lgx);

  /// Extra grande - 20.0
  BorderRadius get xl => BorderRadius.circular(AppSizes.xl);

  /// Extra extra grande - 24.0
  BorderRadius get xxl => BorderRadius.circular(AppSizes.xxl);

  /// Extra extra extra grande - 28.0
  BorderRadius get xxxl => BorderRadius.circular(AppSizes.xxxl);

  /// Enorme - 32.0
  BorderRadius get huge => BorderRadius.circular(AppSizes.huge);

  /// Masivo - 40.0
  BorderRadius get massive => BorderRadius.circular(AppSizes.massive);

  /// Gigante - 48.0
  BorderRadius get giant => BorderRadius.circular(AppSizes.giant);

  /// Completamente circular - 999.0
  BorderRadius get circular => BorderRadius.circular(999.0);
}

/// Radius individuales para esquinas específicas
///
/// Esta clase proporciona valores de tipo [Radius] para usar con
/// `BorderRadius.only()` cuando necesitas controlar cada esquina individualmente.
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ Esquinas asimétricas con diferentes radius
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: AppRadiusCorners._().md,      // 12.0
///       topRight: AppRadiusCorners._().lg,     // 16.0
///       bottomLeft: AppRadiusCorners._().sm,   // 6.0
///       bottomRight: AppRadiusCorners._().xl,  // 20.0
///     ),
///   ),
/// )
///
/// // ✅ Solo esquinas superiores redondeadas
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: AppRadiusCorners._().lg,   // 16.0
///       topRight: AppRadiusCorners._().lg,  // 16.0
///     ),
///   ),
/// )
///
/// // 💡 Alternativa recomendada: usar AppRadius directamente
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: AppRadius.radiusMd,   // Más simple
///       topRight: AppRadius.radiusLg,
///     ),
///   ),
/// )
/// ```
///
/// ### 📦 Valores disponibles
///
/// - `none` → Radius.zero
/// - `xxs` → Radius.circular(2.0)
/// - `xs` → Radius.circular(4.0)
/// - `sm` → Radius.circular(6.0)
/// - `smd` → Radius.circular(8.0)
/// - `mds` → Radius.circular(10.0)
/// - `md` → Radius.circular(12.0) ⭐
/// - `mdl` → Radius.circular(14.0)
/// - `lg` → Radius.circular(16.0)
/// - `lgx` → Radius.circular(18.0)
/// - `xl` → Radius.circular(20.0)
/// - `xxl` → Radius.circular(24.0)
/// - `xxxl` → Radius.circular(28.0)
/// - `huge` → Radius.circular(32.0)
/// - `massive` → Radius.circular(40.0)
/// - `giant` → Radius.circular(48.0)
/// - `circular` → Radius.circular(999.0)
///
/// ### 💡 Ver también
///
/// - [AppRadius] para acceso estático directo
/// - [AppRadiusContainers] para BorderRadius completos
/// - [AppRadiusShapes] para RoundedRectangleBorder
class AppRadiusCorners {
  const AppRadiusCorners._();

  /// Sin radio - Radius.zero
  Radius get none => Radius.zero;

  /// Extra extra pequeño - 2.0
  Radius get xxs => Radius.circular(AppSizes.xxs);

  /// Extra pequeño - 4.0
  Radius get xs => Radius.circular(AppSizes.xs);

  /// Pequeño - 6.0
  Radius get sm => Radius.circular(AppSizes.sm);

  /// Pequeño-mediano - 8.0
  Radius get smd => Radius.circular(AppSizes.smd);

  /// Mediano-pequeño - 10.0
  Radius get mds => Radius.circular(AppSizes.mds);

  /// Mediano - 12.0 (estándar)
  Radius get md => Radius.circular(AppSizes.md);

  /// Mediano-grande - 14.0
  Radius get mdl => Radius.circular(AppSizes.mdl);

  /// Grande - 16.0
  Radius get lg => Radius.circular(AppSizes.lg);

  /// Grande-extra - 18.0
  Radius get lgx => Radius.circular(AppSizes.lgx);

  /// Extra grande - 20.0
  Radius get xl => Radius.circular(AppSizes.xl);

  /// Extra extra grande - 24.0
  Radius get xxl => Radius.circular(AppSizes.xxl);

  /// Extra extra extra grande - 28.0
  Radius get xxxl => Radius.circular(AppSizes.xxxl);

  /// Enorme - 32.0
  Radius get huge => Radius.circular(AppSizes.huge);

  /// Masivo - 40.0
  Radius get massive => Radius.circular(AppSizes.massive);

  /// Gigante - 48.0
  Radius get giant => Radius.circular(AppSizes.giant);

  /// Completamente circular - 999.0
  Radius get circular => Radius.circular(999.0);
}

/// RoundedRectangleBorder listos para usar en shapes de widgets
///
/// Esta clase proporciona instancias pre-configuradas de [RoundedRectangleBorder]
/// listas para usar en propiedades `shape` de widgets como ElevatedButton,
/// Card, Dialog, BottomSheet, etc.
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ En botones
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: AppRadiusShapes._().md,  // RoundedRectangleBorder con radius 12.0
///   ),
///   onPressed: () {},
///   child: Text('Botón'),
/// )
///
/// // ✅ En tarjetas
/// Card(
///   shape: AppRadiusShapes._().lg,  // RoundedRectangleBorder con radius 16.0
///   child: ...,
/// )
///
/// // ✅ En diálogos
/// AlertDialog(
///   shape: AppRadiusShapes._().xl,  // RoundedRectangleBorder con radius 20.0
///   content: ...,
/// )
///
/// // 💡 Alternativa recomendada: usar AppRadius directamente
/// Card(
///   shape: AppRadius.shapeLg,  // Más conveniente
/// )
/// ```
///
/// ### 📦 Valores disponibles
///
/// - `none` → RoundedRectangleBorder sin radius
/// - `xxs` → RoundedRectangleBorder(2.0)
/// - `xs` → RoundedRectangleBorder(4.0)
/// - `sm` → RoundedRectangleBorder(6.0)
/// - `smd` → RoundedRectangleBorder(8.0)
/// - `mds` → RoundedRectangleBorder(10.0)
/// - `md` → RoundedRectangleBorder(12.0) ⭐
/// - `mdl` → RoundedRectangleBorder(14.0)
/// - `lg` → RoundedRectangleBorder(16.0)
/// - `lgx` → RoundedRectangleBorder(18.0)
/// - `xl` → RoundedRectangleBorder(20.0)
/// - `xxl` → RoundedRectangleBorder(24.0)
/// - `xxxl` → RoundedRectangleBorder(28.0)
/// - `huge` → RoundedRectangleBorder(32.0)
/// - `massive` → RoundedRectangleBorder(40.0)
/// - `giant` → RoundedRectangleBorder(48.0)
/// - `circular` → RoundedRectangleBorder(999.0)
///
/// ### 💡 Ver también
///
/// - [AppRadius] para acceso estático directo
/// - [AppRadiusContainers] para BorderRadius
/// - [RoundedRectangleBorder] clase de Flutter
class AppRadiusShapes {
  const AppRadiusShapes._();

  /// Sin radio - RoundedRectangleBorder con BorderRadius.zero
  RoundedRectangleBorder get none => const RoundedRectangleBorder(borderRadius: BorderRadius.zero);

  /// Extra extra pequeño - 2.0
  RoundedRectangleBorder get xxs => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.xxs));

  /// Extra pequeño - 4.0
  RoundedRectangleBorder get xs => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.xs));

  /// Pequeño - 6.0
  RoundedRectangleBorder get sm => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.sm));

  /// Pequeño-mediano - 8.0
  RoundedRectangleBorder get smd => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.smd));

  /// Mediano-pequeño - 10.0
  RoundedRectangleBorder get mds => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.mds));

  /// Mediano - 12.0 (estándar)
  RoundedRectangleBorder get md => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.md));

  /// Mediano-grande - 14.0
  RoundedRectangleBorder get mdl => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.mdl));

  /// Grande - 16.0
  RoundedRectangleBorder get lg => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.lg));

  /// Grande-extra - 18.0
  RoundedRectangleBorder get lgx => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.lgx));

  /// Extra grande - 20.0
  RoundedRectangleBorder get xl => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.xl));

  /// Extra extra grande - 24.0
  RoundedRectangleBorder get xxl => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.xxl));

  /// Extra extra extra grande - 28.0
  RoundedRectangleBorder get xxxl => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.xxxl));

  /// Enorme - 32.0
  RoundedRectangleBorder get huge => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.huge));

  /// Masivo - 40.0
  RoundedRectangleBorder get massive => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.massive));

  /// Gigante - 48.0
  RoundedRectangleBorder get giant => RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.giant));

  /// Completamente circular - 999.0
  RoundedRectangleBorder get circular => RoundedRectangleBorder(borderRadius: BorderRadius.circular(999.0));
}

/// Métodos helper para crear BorderRadius parciales (solo algunos lados)
///
/// Esta clase proporciona métodos para crear rápidamente BorderRadius
/// que afectan solo a ciertos lados del widget (top, bottom, left, right),
/// útil para crear efectos visuales donde solo algunas esquinas son redondeadas.
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ Solo esquinas superiores redondeadas (tarjetas expandibles)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusPartial._().onlyTop(16.0),
///     // Equivalente a:
///     // BorderRadius.only(
///     //   topLeft: Radius.circular(16.0),
///     //   topRight: Radius.circular(16.0),
///     // )
///   ),
/// )
///
/// // ✅ Solo esquinas inferiores redondeadas (bottom sheets)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusPartial._().onlyBottom(AppSizes.lg),  // 16.0
///   ),
/// )
///
/// // ✅ Solo lado izquierdo redondeado
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusPartial._().onlyLeft(12.0),
///   ),
/// )
///
/// // ✅ Solo lado derecho redondeado
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusPartial._().onlyRight(AppSizes.md),  // 12.0
///   ),
/// )
/// ```
///
/// ### 📋 Métodos disponibles
///
/// - `onlyTop(radius)` → Redondea solo esquinas superiores (topLeft + topRight)
/// - `onlyBottom(radius)` → Redondea solo esquinas inferiores (bottomLeft + bottomRight)
/// - `onlyLeft(radius)` → Redondea solo esquinas izquierdas (topLeft + bottomLeft)
/// - `onlyRight(radius)` → Redondea solo esquinas derechas (topRight + bottomRight)
///
/// ### 💡 Casos de uso comunes
///
/// ```dart
/// // Modal/Dialog con solo parte superior redondeada
/// Dialog(
///   shape: RoundedRectangleBorder(
///     borderRadius: AppRadiusPartial._().onlyTop(20.0),
///   ),
/// )
///
/// // Bottom sheet con solo parte superior redondeada
/// showModalBottomSheet(
///   shape: RoundedRectangleBorder(
///     borderRadius: AppRadiusPartial._().onlyTop(24.0),
///   ),
/// )
///
/// // Tarjeta con efecto de pestañas (solo top)
/// Card(
///   shape: RoundedRectangleBorder(
///     borderRadius: AppRadiusPartial._().onlyTop(16.0),
///   ),
/// )
/// ```
///
/// ### 💡 Ver también
///
/// - [AppRadiusOnly] para combinaciones pre-configuradas
/// - [AppRadius] para acceso estático directo
/// - [BorderRadius.only] constructor de Flutter
class AppRadiusPartial {
  const AppRadiusPartial._();

  /// Redondea solo las esquinas superiores (topLeft + topRight)
  ///
  /// Ejemplo:
  /// ```dart
  /// AppRadiusPartial._().onlyTop(16.0)
  /// // BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))
  /// ```
  BorderRadius onlyTop(double radius) => BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      );

  /// Redondea solo las esquinas inferiores (bottomLeft + bottomRight)
  ///
  /// Ejemplo:
  /// ```dart
  /// AppRadiusPartial._().onlyBottom(16.0)
  /// // BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))
  /// ```
  BorderRadius onlyBottom(double radius) => BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );

  /// Redondea solo las esquinas del lado izquierdo (topLeft + bottomLeft)
  ///
  /// Ejemplo:
  /// ```dart
  /// AppRadiusPartial._().onlyLeft(16.0)
  /// // BorderRadius.only(topLeft: Radius.circular(16.0), bottomLeft: Radius.circular(16.0))
  /// ```
  BorderRadius onlyLeft(double radius) => BorderRadius.only(
        topLeft: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
      );

  /// Redondea solo las esquinas del lado derecho (topRight + bottomRight)
  ///
  /// Ejemplo:
  /// ```dart
  /// AppRadiusPartial._().onlyRight(16.0)
  /// // BorderRadius.only(topRight: Radius.circular(16.0), bottomRight: Radius.circular(16.0))
  /// ```
  BorderRadius onlyRight(double radius) => BorderRadius.only(
        topRight: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );
}

/// Acceso a BorderRadius parciales pre-configurados (top/bottom)
///
/// Esta clase proporciona acceso a conjuntos de BorderRadius pre-configurados
/// para esquinas superiores e inferiores en todos los tamaños estándar.
/// Es útil cuando necesitas aplicar rápidamente estilos consistentes
/// a modales, bottom sheets, tarjetas, etc.
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ Solo parte superior redondeada (tamaño mediano)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusOnly().top.rightMd,  // Solo top con 12.0
///   ),
/// )
///
/// // ✅ Solo parte inferior redondeada (tamaño grande)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusOnly().bottom.rightLg,  // Solo bottom con 16.0
///   ),
/// )
///
/// // ✅ Bottom sheet con parte superior redondeada
/// showModalBottomSheet(
///   shape: RoundedRectangleBorder(
///     borderRadius: AppRadiusOnly().top.rightXl,  // 20.0 en top
///   ),
/// )
/// ```
///
/// ### 📋 Estructura
///
/// - `top` → [_AppRadiusTop] - Esquinas superiores
///   - `rightXs`, `rightSm`, `rightMd`, `rightLg`, `rightXl`, etc.
///   - `leftXs`, `leftSm`, `leftMd`, `leftLg`, `leftXl`, etc.
///
/// - `bottom` → [_AppRadiusBottom] - Esquinas inferiores
///   - `rightXs`, `rightSm`, `rightMd`, `rightLg`, `rightXl`, etc.
///   - `leftXs`, `leftSm`, `leftMd`, `leftLg`, `leftXl`, etc.
///
/// ### ⚠️ Nota sobre nomenclatura
///
/// Los nombres `right` y `left` pueden parecer contraintuitivos:
/// - `top.rightXs` → Aplica radius a las esquinas SUPERIORES
/// - `top.leftXs` → Aplica radius a las esquinas INFERIORES
/// - `bottom.rightXs` → Aplica radius a las esquinas INFERIORES
/// - `bottom.leftXs` → Aplica radius a las esquinas SUPERIORES
///
/// 💡 Recomendación: usar directamente los nombres que indican la posición
/// real de las esquinas para evitar confusión.
///
/// ### 💡 Ver también
///
/// - [AppRadiusPartial] para métodos dinámicos
/// - [_AppRadiusTop] para detalles de esquinas superiores
/// - [_AppRadiusBottom] para detalles de esquinas inferiores
class AppRadiusOnly {
  /// Esquinas inferiores pre-configuradas
  _AppRadiusBottom bottom = _AppRadiusBottom._();

  /// Esquinas superiores pre-configuradas
  _AppRadiusTop top = _AppRadiusTop._();
}

/// BorderRadius pre-configurados para esquinas inferiores y superiores
///
/// Clase interna que proporciona BorderRadius donde solo las esquinas
/// inferiores (bottomLeft + bottomRight) o superiores (topLeft + topRight)
/// están redondeadas, en todos los tamaños estándar.
///
/// ### 🎨 Uso (a través de AppRadiusOnly)
///
/// ```dart
/// // ✅ Esquinas inferiores redondeadas
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusOnly().bottom.rightMd,  // bottom con 12.0
///   ),
/// )
///
/// // ✅ Esquinas superiores redondeadas (usando bottom.left)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusOnly().bottom.leftLg,  // top con 16.0
///   ),
/// )
/// ```
///
/// ### ⚠️ Nota importante sobre nomenclatura
///
/// - `right*` → Redondea las esquinas **INFERIORES** (bottomLeft + bottomRight)
/// - `left*` → Redondea las esquinas **SUPERIORES** (topLeft + topRight)
///
/// Esta nomenclatura puede ser confusa. Para mayor claridad, considere usar
/// [AppRadiusPartial] con métodos como `onlyBottom()` y `onlyTop()`.
///
/// ### 📦 Propiedades disponibles
///
/// #### Esquinas inferiores (right*)
/// - `rightXs` (4.0), `rightSm` (6.0), `rightSmd` (8.0)
/// - `rightMd` (12.0) ⭐, `rightLg` (16.0), `rightXl` (20.0)
/// - `rightXxl` (24.0), `rightHuge` (32.0), `rightMassive` (40.0)
/// - `rightGiant` (48.0), `rightCircular` (999.0)
///
/// #### Esquinas superiores (left*)
/// - `leftXs` (4.0), `leftSm` (6.0), `leftSmd` (8.0)
/// - `leftMd` (12.0) ⭐, `leftLg` (16.0), `leftXl` (20.0)
/// - `leftXxl` (24.0), `leftHuge` (32.0), `leftMassive` (40.0)
/// - `leftGiant` (48.0), `leftCircular` (999.0)
///
/// ### 💡 Ver también
///
/// - [AppRadiusOnly] clase contenedora
/// - [_AppRadiusTop] contraparte para configuraciones top
/// - [AppRadiusPartial] para métodos más intuitivos
class _AppRadiusBottom {
  const _AppRadiusBottom._();

  /// BorderRadius solo en esquinas inferiores - 4.0
  BorderRadius get rightXs => BorderRadius.only(bottomLeft: AppRadius.radiusXs, bottomRight: AppRadius.radiusXs);

  /// BorderRadius solo en esquinas inferiores - 6.0
  BorderRadius get rightSm => BorderRadius.only(bottomLeft: AppRadius.radiusSm, bottomRight: AppRadius.radiusSm);

  /// BorderRadius solo en esquinas inferiores - 8.0
  BorderRadius get rightSmd => BorderRadius.only(bottomLeft: AppRadius.radiusSmd, bottomRight: AppRadius.radiusSmd);

  /// BorderRadius solo en esquinas inferiores - 12.0 (estándar)
  BorderRadius get rightMd => BorderRadius.only(bottomLeft: AppRadius.radiusMd, bottomRight: AppRadius.radiusMd);

  /// BorderRadius solo en esquinas inferiores - 16.0
  BorderRadius get rightLg => BorderRadius.only(bottomLeft: AppRadius.radiusLg, bottomRight: AppRadius.radiusLg);

  /// BorderRadius solo en esquinas inferiores - 20.0
  BorderRadius get rightXl => BorderRadius.only(bottomLeft: AppRadius.radiusXl, bottomRight: AppRadius.radiusXl);

  /// BorderRadius solo en esquinas inferiores - 24.0
  BorderRadius get rightXxl => BorderRadius.only(bottomLeft: AppRadius.radiusXxl, bottomRight: AppRadius.radiusXxl);

  /// BorderRadius solo en esquinas inferiores - 32.0
  BorderRadius get rightHuge => BorderRadius.only(bottomLeft: AppRadius.radiusHuge, bottomRight: AppRadius.radiusHuge);

  /// BorderRadius solo en esquinas inferiores - 40.0
  BorderRadius get rightMassive => BorderRadius.only(bottomLeft: AppRadius.radiusMassive, bottomRight: AppRadius.radiusMassive);

  /// BorderRadius solo en esquinas inferiores - 48.0
  BorderRadius get rightGiant => BorderRadius.only(bottomLeft: AppRadius.radiusGiant, bottomRight: AppRadius.radiusGiant);

  /// BorderRadius solo en esquinas inferiores - 999.0 (circular)
  BorderRadius get rightCircular => BorderRadius.only(bottomLeft: AppRadius.radiusCircular, bottomRight: AppRadius.radiusCircular);

  /// BorderRadius solo en esquinas superiores - 4.0
  BorderRadius get leftXs => BorderRadius.only(topLeft: AppRadius.radiusXs, topRight: AppRadius.radiusXs);

  /// BorderRadius solo en esquinas superiores - 6.0
  BorderRadius get leftSm => BorderRadius.only(topLeft: AppRadius.radiusSm, topRight: AppRadius.radiusSm);

  /// BorderRadius solo en esquinas superiores - 8.0
  BorderRadius get leftSmd => BorderRadius.only(topLeft: AppRadius.radiusSmd, topRight: AppRadius.radiusSmd);

  /// BorderRadius solo en esquinas superiores - 12.0 (estándar)
  BorderRadius get leftMd => BorderRadius.only(topLeft: AppRadius.radiusMd, topRight: AppRadius.radiusMd);

  /// BorderRadius solo en esquinas superiores - 16.0
  BorderRadius get leftLg => BorderRadius.only(topLeft: AppRadius.radiusLg, topRight: AppRadius.radiusLg);

  /// BorderRadius solo en esquinas superiores - 20.0
  BorderRadius get leftXl => BorderRadius.only(topLeft: AppRadius.radiusXl, topRight: AppRadius.radiusXl);

  /// BorderRadius solo en esquinas superiores - 24.0
  BorderRadius get leftXxl => BorderRadius.only(topLeft: AppRadius.radiusXxl, topRight: AppRadius.radiusXxl);

  /// BorderRadius solo en esquinas superiores - 32.0
  BorderRadius get leftHuge => BorderRadius.only(topLeft: AppRadius.radiusHuge, topRight: AppRadius.radiusHuge);

  /// BorderRadius solo en esquinas superiores - 40.0
  BorderRadius get leftMassive => BorderRadius.only(topLeft: AppRadius.radiusMassive, topRight: AppRadius.radiusMassive);

  /// BorderRadius solo en esquinas superiores - 48.0
  BorderRadius get leftGiant => BorderRadius.only(topLeft: AppRadius.radiusGiant, topRight: AppRadius.radiusGiant);

  /// BorderRadius solo en esquinas superiores - 999.0 (circular)
  BorderRadius get leftCircular => BorderRadius.only(topLeft: AppRadius.radiusCircular, topRight: AppRadius.radiusCircular);
}

/// BorderRadius pre-configurados para esquinas superiores e inferiores
///
/// Clase interna que proporciona BorderRadius donde solo las esquinas
/// superiores (topLeft + topRight) o inferiores (bottomLeft + bottomRight)
/// están redondeadas, en todos los tamaños estándar.
///
/// ### 🎨 Uso (a través de AppRadiusOnly)
///
/// ```dart
/// // ✅ Esquinas superiores redondeadas
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusOnly().top.rightMd,  // top con 12.0
///   ),
/// )
///
/// // ✅ Esquinas inferiores redondeadas (usando top.left)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusOnly().top.leftLg,  // bottom con 16.0
///   ),
/// )
/// ```
///
/// ### ⚠️ Nota importante sobre nomenclatura
///
/// - `right*` → Redondea las esquinas **SUPERIORES** (topLeft + topRight)
/// - `left*` → Redondea las esquinas **INFERIORES** (bottomLeft + bottomRight)
///
/// Esta nomenclatura puede ser confusa. Para mayor claridad, considere usar
/// [AppRadiusPartial] con métodos como `onlyTop()` y `onlyBottom()`.
///
/// ### 📦 Propiedades disponibles
///
/// #### Esquinas superiores (right*)
/// - `rightXs` (4.0), `rightSm` (6.0), `rightSmd` (8.0)
/// - `rightMd` (12.0) ⭐, `rightLg` (16.0), `rightXl` (20.0)
/// - `rightXxl` (24.0), `rightHuge` (32.0), `rightMassive` (40.0)
/// - `rightGiant` (48.0), `rightCircular` (999.0)
///
/// #### Esquinas inferiores (left*)
/// - `leftXs` (4.0), `leftSm` (6.0), `leftSmd` (8.0)
/// - `leftMd` (12.0) ⭐, `leftLg` (16.0), `leftXl` (20.0)
/// - `leftXxl` (24.0), `leftHuge` (32.0), `leftMassive` (40.0)
/// - `leftGiant` (48.0), `leftCircular` (999.0)
///
/// ### 💡 Ver también
///
/// - [AppRadiusOnly] clase contenedora
/// - [_AppRadiusBottom] contraparte para configuraciones bottom
/// - [AppRadiusPartial] para métodos más intuitivos
class _AppRadiusTop {
  const _AppRadiusTop._();

  /// BorderRadius solo en esquinas superiores - 4.0
  BorderRadius get rightXs => BorderRadius.only(topLeft: AppRadius.radiusXs, topRight: AppRadius.radiusXs);

  /// BorderRadius solo en esquinas superiores - 6.0
  BorderRadius get rightSm => BorderRadius.only(topLeft: AppRadius.radiusSm, topRight: AppRadius.radiusSm);

  /// BorderRadius solo en esquinas superiores - 8.0
  BorderRadius get rightSmd => BorderRadius.only(topLeft: AppRadius.radiusSmd, topRight: AppRadius.radiusSmd);

  /// BorderRadius solo en esquinas superiores - 12.0 (estándar)
  BorderRadius get rightMd => BorderRadius.only(topLeft: AppRadius.radiusMd, topRight: AppRadius.radiusMd);

  /// BorderRadius solo en esquinas superiores - 16.0
  BorderRadius get rightLg => BorderRadius.only(topLeft: AppRadius.radiusLg, topRight: AppRadius.radiusLg);

  /// BorderRadius solo en esquinas superiores - 20.0
  BorderRadius get rightXl => BorderRadius.only(topLeft: AppRadius.radiusXl, topRight: AppRadius.radiusXl);

  /// BorderRadius solo en esquinas superiores - 24.0
  BorderRadius get rightXxl => BorderRadius.only(topLeft: AppRadius.radiusXxl, topRight: AppRadius.radiusXxl);

  /// BorderRadius solo en esquinas superiores - 32.0
  BorderRadius get rightHuge => BorderRadius.only(topLeft: AppRadius.radiusHuge, topRight: AppRadius.radiusHuge);

  /// BorderRadius solo en esquinas superiores - 40.0
  BorderRadius get rightMassive => BorderRadius.only(topLeft: AppRadius.radiusMassive, topRight: AppRadius.radiusMassive);

  /// BorderRadius solo en esquinas superiores - 48.0
  BorderRadius get rightGiant => BorderRadius.only(topLeft: AppRadius.radiusGiant, topRight: AppRadius.radiusGiant);

  /// BorderRadius solo en esquinas superiores - 999.0 (circular)
  BorderRadius get rightCircular => BorderRadius.only(topLeft: AppRadius.radiusCircular, topRight: AppRadius.radiusCircular);

  /// BorderRadius solo en esquinas inferiores - 4.0
  BorderRadius get leftXs => BorderRadius.only(bottomLeft: AppRadius.radiusXs, bottomRight: AppRadius.radiusXs);

  /// BorderRadius solo en esquinas inferiores - 6.0
  BorderRadius get leftSm => BorderRadius.only(bottomLeft: AppRadius.radiusSm, bottomRight: AppRadius.radiusSm);

  /// BorderRadius solo en esquinas inferiores - 8.0
  BorderRadius get leftSmd => BorderRadius.only(bottomLeft: AppRadius.radiusSmd, bottomRight: AppRadius.radiusSmd);

  /// BorderRadius solo en esquinas inferiores - 12.0 (estándar)
  BorderRadius get leftMd => BorderRadius.only(bottomLeft: AppRadius.radiusMd, bottomRight: AppRadius.radiusMd);

  /// BorderRadius solo en esquinas inferiores - 16.0
  BorderRadius get leftLg => BorderRadius.only(bottomLeft: AppRadius.radiusLg, bottomRight: AppRadius.radiusLg);

  /// BorderRadius solo en esquinas inferiores - 20.0
  BorderRadius get leftXl => BorderRadius.only(bottomLeft: AppRadius.radiusXl, bottomRight: AppRadius.radiusXl);

  /// BorderRadius solo en esquinas inferiores - 24.0
  BorderRadius get leftXxl => BorderRadius.only(bottomLeft: AppRadius.radiusXxl, bottomRight: AppRadius.radiusXxl);

  /// BorderRadius solo en esquinas inferiores - 32.0
  BorderRadius get leftHuge => BorderRadius.only(bottomLeft: AppRadius.radiusHuge, bottomRight: AppRadius.radiusHuge);

  /// BorderRadius solo en esquinas inferiores - 40.0
  BorderRadius get leftMassive => BorderRadius.only(bottomLeft: AppRadius.radiusMassive, bottomRight: AppRadius.radiusMassive);

  /// BorderRadius solo en esquinas inferiores - 48.0
  BorderRadius get leftGiant => BorderRadius.only(bottomLeft: AppRadius.radiusGiant, bottomRight: AppRadius.radiusGiant);

  /// BorderRadius solo en esquinas inferiores - 999.0 (circular)
  BorderRadius get leftCircular => BorderRadius.only(bottomLeft: AppRadius.radiusCircular, bottomRight: AppRadius.radiusCircular);
}

/// Sistema jerárquico de acceso a todos los tipos de radius
///
/// Esta clase proporciona una estructura organizada para acceder a todas
/// las variantes de radius disponibles en la aplicación. Es útil cuando
/// prefieres un enfoque más modular y jerárquico en lugar del acceso
/// estático directo de [AppRadius].
///
/// ### 🎨 Uso
///
/// ```dart
/// // ✅ Acceso a valores base (double)
/// double radiusValue = AppRadiusSystem().base.md;  // 12.0
///
/// // ✅ Acceso a BorderRadius
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusSystem().containers.lg,  // BorderRadius.circular(16.0)
///   ),
/// )
///
/// // ✅ Acceso a Radius individuales
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: AppRadiusSystem().corners.md,
///       topRight: AppRadiusSystem().corners.lg,
///     ),
///   ),
/// )
///
/// // ✅ Acceso a RoundedRectangleBorder
/// Card(
///   shape: AppRadiusSystem().shapes.md,
/// )
///
/// // ✅ Acceso a métodos parciales
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusSystem().partial.onlyTop(16.0),
///   ),
/// )
///
/// // ✅ Acceso a radius pre-configurados
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadiusSystem().only.top.rightMd,
///   ),
/// )
/// ```
///
/// ### 📋 Estructura del sistema
///
/// - `base` → [AppRadiusBase] - Valores double base (2.0, 4.0, 6.0, etc.)
/// - `containers` → [AppRadiusContainers] - BorderRadius listos para usar
/// - `corners` → [AppRadiusCorners] - Radius individuales para esquinas
/// - `shapes` → [AppRadiusShapes] - RoundedRectangleBorder para widgets
/// - `partial` → [AppRadiusPartial] - Métodos para radius parciales
/// - `only` → [AppRadiusOnly] - Configuraciones pre-hechas top/bottom
///
/// ### 💡 Comparación con AppRadius estático
///
/// ```dart
/// // Sistema jerárquico (más verboso)
/// AppRadiusSystem().containers.md
///
/// // Acceso estático (más directo) ⭐
/// AppRadius.borderMd
///
/// // Ambos son equivalentes, usa el que prefieras
/// ```
///
/// ### 💡 Ver también
///
/// - [AppRadius] para acceso estático directo (recomendado)
/// - [AppRadiusBase] para valores numéricos
/// - [AppRadiusContainers] para BorderRadius
/// - [AppRadiusCorners] para Radius
/// - [AppRadiusShapes] para RoundedRectangleBorder
/// - [AppRadiusPartial] para métodos helper
/// - [AppRadiusOnly] para configuraciones pre-hechas
class AppRadiusSystem {
  /// Valores base de radius como `double`
  AppRadiusBase get base => AppRadiusBase._();

  /// BorderRadius listos para usar
  AppRadiusContainers get containers => AppRadiusContainers._();

  /// Radius individuales para esquinas
  AppRadiusCorners get corners => AppRadiusCorners._();

  /// RoundedRectangleBorder para shapes
  AppRadiusShapes get shapes => AppRadiusShapes._();

  /// Métodos helper para radius parciales
  AppRadiusPartial get partial => AppRadiusPartial._();

  /// Configuraciones pre-hechas top/bottom
  AppRadiusOnly get only => AppRadiusOnly();
}
