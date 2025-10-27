import 'package:flutter/material.dart';
import 'app_sizes.dart';

/// Sistema de border radius para mantener consistencia visual en toda la aplicación
///
/// Proporciona valores base, BorderRadius, Radius y RoundedRectangleBorder
/// listos para usar en widgets de Flutter.
///
/// **Valores base** (double): Usa estos en propiedades que requieren `double`
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(AppRadius.md),
///   ),
/// )
/// ```
///
/// **BorderRadius**: Para decoraciones de Container
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: AppRadius.borderMd,
///   ),
/// )
/// ```
///
/// **Radius**: Para esquinas individuales
/// ```dart
/// BorderRadius.only(
///   topLeft: AppRadius.radiusMd,
///   topRight: AppRadius.radiusLg,
/// )
/// ```
///
/// **RoundedRectangleBorder**: Para botones y cards
/// ```dart
/// ElevatedButton(
///   style: ElevatedButton.styleFrom(
///     shape: AppRadius.shapeMd,
///   ),
/// )
/// ```
///
/// Usa la escala de [AppSizes] para mantener coherencia en toda la app.
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
}
