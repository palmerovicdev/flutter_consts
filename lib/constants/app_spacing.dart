import 'package:flutter/material.dart';
import 'app_sizes.dart';

/// Sistema de espaciado para mantener consistencia en padding y margin
///
/// Proporciona valores base (double) y EdgeInsets predefinidos para
/// padding uniforme, horizontal y vertical.
///
/// **Uso básico:**
/// ```dart
/// // Valores base (double)
/// SizedBox(height: AppSpacing.md);
///
/// // EdgeInsets predefinidos
/// Padding(
///   padding: AppSpacing.paddingMd, // EdgeInsets.all(12.0)
///   child: Text('Contenido'),
/// );
///
/// // Espaciado horizontal
/// Padding(
///   padding: AppSpacing.horizontalLg, // EdgeInsets.symmetric(horizontal: 16.0)
///   child: Row(...),
/// );
///
/// // Espaciado vertical
/// Padding(
///   padding: AppSpacing.verticalMd, // EdgeInsets.symmetric(vertical: 12.0)
///   child: Column(...),
/// );
/// ```
///
/// Usa la escala de [AppSizes] para mantener coherencia en toda la app.
class AppSpacing {
  AppSpacing._();

  // Valores base de espaciado
  /// 0.0 - Sin espaciado
  static const double none = AppSizes.none;

  /// 2.0 - Extra extra pequeño
  static const double xxs = AppSizes.xxs;

  /// 4.0 - Extra pequeño
  static const double xs = AppSizes.xs;

  /// 6.0 - Pequeño
  static const double sm = AppSizes.sm;

  /// 8.0 - Pequeño-mediano
  static const double smd = AppSizes.smd;

  /// 10.0 - Mediano-pequeño
  static const double mds = AppSizes.mds;

  /// 12.0 - Mediano (uso común)
  static const double md = AppSizes.md;

  /// 14.0 - Mediano-grande
  static const double mdl = AppSizes.mdl;

  /// 16.0 - Grande (muy usado en layouts)
  static const double lg = AppSizes.lg;

  /// 18.0 - Grande-extra
  static const double lgx = AppSizes.lgx;

  /// 20.0 - Extra grande
  static const double xl = AppSizes.xl;

  /// 24.0 - Extra extra grande
  static const double xxl = AppSizes.xxl;

  /// 28.0 - Extra extra extra grande
  static const double xxxl = AppSizes.xxxl;

  /// 32.0 - Enorme
  static const double huge = AppSizes.huge;

  /// 40.0 - Masivo
  static const double massive = AppSizes.massive;

  /// 48.0 - Gigante
  static const double giant = AppSizes.giant;

  /// 56.0 - Mega
  static const double mega = AppSizes.mega;

  /// 64.0 - Ultra
  static const double ultra = AppSizes.ultra;

  // EdgeInsets.all() - Padding en todos los lados
  /// 0.0 - Sin padding
  static const EdgeInsets paddingNone = EdgeInsets.zero;

  /// 2.0 - Padding extra extra pequeño
  static const EdgeInsets paddingXxs = EdgeInsets.all(xxs);

  /// 4.0 - Padding extra pequeño
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);

  /// 6.0 - Padding pequeño
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);

  /// 8.0 - Padding pequeño-mediano
  static const EdgeInsets paddingSmd = EdgeInsets.all(smd);

  /// 10.0 - Padding mediano-pequeño
  static const EdgeInsets paddingMds = EdgeInsets.all(mds);

  /// 12.0 - Padding mediano (uso común)
  static const EdgeInsets paddingMd = EdgeInsets.all(md);

  /// 14.0 - Padding mediano-grande
  static const EdgeInsets paddingMdl = EdgeInsets.all(mdl);

  /// 16.0 - Padding grande (muy usado)
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);

  /// 18.0 - Padding grande-extra
  static const EdgeInsets paddingLgx = EdgeInsets.all(lgx);

  /// 20.0 - Padding extra grande
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  /// 24.0 - Padding extra extra grande
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  /// 28.0 - Padding extra extra extra grande
  static const EdgeInsets paddingXxxl = EdgeInsets.all(xxxl);

  /// 32.0 - Padding enorme
  static const EdgeInsets paddingHuge = EdgeInsets.all(huge);

  /// 40.0 - Padding masivo
  static const EdgeInsets paddingMassive = EdgeInsets.all(massive);

  /// 48.0 - Padding gigante
  static const EdgeInsets paddingGiant = EdgeInsets.all(giant);

  /// 56.0 - Padding mega
  static const EdgeInsets paddingMega = EdgeInsets.all(mega);

  /// 64.0 - Padding ultra
  static const EdgeInsets paddingUltra = EdgeInsets.all(ultra);

  // EdgeInsets.symmetric(horizontal) - Padding horizontal
  /// 0.0 - Sin padding horizontal
  static const EdgeInsets horizontalNone = EdgeInsets.zero;

  /// 2.0 - Padding horizontal extra extra pequeño
  static const EdgeInsets horizontalXxs = EdgeInsets.symmetric(horizontal: xxs);

  /// 4.0 - Padding horizontal extra pequeño
  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(horizontal: xs);

  /// 6.0 - Padding horizontal pequeño
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);

  /// 8.0 - Padding horizontal pequeño-mediano
  static const EdgeInsets horizontalSmd = EdgeInsets.symmetric(horizontal: smd);

  /// 10.0 - Padding horizontal mediano-pequeño
  static const EdgeInsets horizontalMds = EdgeInsets.symmetric(horizontal: mds);

  /// 12.0 - Padding horizontal mediano
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);

  /// 14.0 - Padding horizontal mediano-grande
  static const EdgeInsets horizontalMdl = EdgeInsets.symmetric(horizontal: mdl);

  /// 16.0 - Padding horizontal grande (muy usado en screens)
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  /// 18.0 - Padding horizontal grande-extra
  static const EdgeInsets horizontalLgx = EdgeInsets.symmetric(horizontal: lgx);

  /// 20.0 - Padding horizontal extra grande
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);

  /// 24.0 - Padding horizontal extra extra grande
  static const EdgeInsets horizontalXxl = EdgeInsets.symmetric(horizontal: xxl);

  /// 28.0 - Padding horizontal extra extra extra grande
  static const EdgeInsets horizontalXxxl = EdgeInsets.symmetric(horizontal: xxxl);

  /// 32.0 - Padding horizontal enorme
  static const EdgeInsets horizontalHuge = EdgeInsets.symmetric(horizontal: huge);

  /// 40.0 - Padding horizontal masivo
  static const EdgeInsets horizontalMassive = EdgeInsets.symmetric(horizontal: massive);

  /// 48.0 - Padding horizontal gigante
  static const EdgeInsets horizontalGiant = EdgeInsets.symmetric(horizontal: giant);

  /// 56.0 - Padding horizontal mega
  static const EdgeInsets horizontalMega = EdgeInsets.symmetric(horizontal: mega);

  /// 64.0 - Padding horizontal ultra
  static const EdgeInsets horizontalUltra = EdgeInsets.symmetric(horizontal: ultra);

  // EdgeInsets.symmetric(vertical) - Padding vertical
  /// 0.0 - Sin padding vertical
  static const EdgeInsets verticalNone = EdgeInsets.zero;

  /// 2.0 - Padding vertical extra extra pequeño
  static const EdgeInsets verticalXxs = EdgeInsets.symmetric(vertical: xxs);

  /// 4.0 - Padding vertical extra pequeño
  static const EdgeInsets verticalXs = EdgeInsets.symmetric(vertical: xs);

  /// 6.0 - Padding vertical pequeño
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);

  /// 8.0 - Padding vertical pequeño-mediano
  static const EdgeInsets verticalSmd = EdgeInsets.symmetric(vertical: smd);

  /// 10.0 - Padding vertical mediano-pequeño
  static const EdgeInsets verticalMds = EdgeInsets.symmetric(vertical: mds);

  /// 12.0 - Padding vertical mediano
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);

  /// 14.0 - Padding vertical mediano-grande
  static const EdgeInsets verticalMdl = EdgeInsets.symmetric(vertical: mdl);

  /// 16.0 - Padding vertical grande
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  /// 18.0 - Padding vertical grande-extra
  static const EdgeInsets verticalLgx = EdgeInsets.symmetric(vertical: lgx);

  /// 20.0 - Padding vertical extra grande
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: xl);

  /// 24.0 - Padding vertical extra extra grande
  static const EdgeInsets verticalXxl = EdgeInsets.symmetric(vertical: xxl);

  /// 28.0 - Padding vertical extra extra extra grande
  static const EdgeInsets verticalXxxl = EdgeInsets.symmetric(vertical: xxxl);

  /// 32.0 - Padding vertical enorme
  static const EdgeInsets verticalHuge = EdgeInsets.symmetric(vertical: huge);

  /// 40.0 - Padding vertical masivo
  static const EdgeInsets verticalMassive = EdgeInsets.symmetric(vertical: massive);

  /// 48.0 - Padding vertical gigante
  static const EdgeInsets verticalGiant = EdgeInsets.symmetric(vertical: giant);

  /// 56.0 - Padding vertical mega
  static const EdgeInsets verticalMega = EdgeInsets.symmetric(vertical: mega);

  /// 64.0 - Padding vertical ultra
  static const EdgeInsets verticalUltra = EdgeInsets.symmetric(vertical: ultra);

  // SizedBox - Gaps verticales
  /// 0.0 - Sin espacio vertical
  static const SizedBox gapNone = SizedBox.shrink();

  /// 2.0 - Gap vertical extra extra pequeño
  static const SizedBox gapXxs = SizedBox(height: xxs);

  /// 4.0 - Gap vertical extra pequeño
  static const SizedBox gapXs = SizedBox(height: xs);

  /// 6.0 - Gap vertical pequeño
  static const SizedBox gapSm = SizedBox(height: sm);

  /// 8.0 - Gap vertical pequeño-mediano
  static const SizedBox gapSmd = SizedBox(height: smd);

  /// 10.0 - Gap vertical mediano-pequeño
  static const SizedBox gapMds = SizedBox(height: mds);

  /// 12.0 - Gap vertical mediano
  static const SizedBox gapMd = SizedBox(height: md);

  /// 14.0 - Gap vertical mediano-grande
  static const SizedBox gapMdl = SizedBox(height: mdl);

  /// 16.0 - Gap vertical grande (común en Column)
  static const SizedBox gapLg = SizedBox(height: lg);

  /// 18.0 - Gap vertical grande-extra
  static const SizedBox gapLgx = SizedBox(height: lgx);

  /// 20.0 - Gap vertical extra grande
  static const SizedBox gapXl = SizedBox(height: xl);

  /// 24.0 - Gap vertical extra extra grande
  static const SizedBox gapXxl = SizedBox(height: xxl);

  /// 28.0 - Gap vertical extra extra extra grande
  static const SizedBox gapXxxl = SizedBox(height: xxxl);

  /// 32.0 - Gap vertical enorme
  static const SizedBox gapHuge = SizedBox(height: huge);

  /// 40.0 - Gap vertical masivo
  static const SizedBox gapMassive = SizedBox(height: massive);

  /// 48.0 - Gap vertical gigante
  static const SizedBox gapGiant = SizedBox(height: giant);

  /// 56.0 - Gap vertical mega
  static const SizedBox gapMega = SizedBox(height: mega);

  /// 64.0 - Gap vertical ultra
  static const SizedBox gapUltra = SizedBox(height: ultra);

  // SizedBox - Gaps horizontales
  /// 0.0 - Sin espacio horizontal
  static const SizedBox gapHorizontalNone = SizedBox.shrink();

  /// 2.0 - Gap horizontal extra extra pequeño
  static const SizedBox gapHorizontalXxs = SizedBox(width: xxs);

  /// 4.0 - Gap horizontal extra pequeño
  static const SizedBox gapHorizontalXs = SizedBox(width: xs);

  /// 6.0 - Gap horizontal pequeño
  static const SizedBox gapHorizontalSm = SizedBox(width: sm);

  /// 8.0 - Gap horizontal pequeño-mediano
  static const SizedBox gapHorizontalSmd = SizedBox(width: smd);

  /// 10.0 - Gap horizontal mediano-pequeño
  static const SizedBox gapHorizontalMds = SizedBox(width: mds);

  /// 12.0 - Gap horizontal mediano
  static const SizedBox gapHorizontalMd = SizedBox(width: md);

  /// 14.0 - Gap horizontal mediano-grande
  static const SizedBox gapHorizontalMdl = SizedBox(width: mdl);

  /// 16.0 - Gap horizontal grande (común en Row)
  static const SizedBox gapHorizontalLg = SizedBox(width: lg);

  /// 18.0 - Gap horizontal grande-extra
  static const SizedBox gapHorizontalLgx = SizedBox(width: lgx);

  /// 20.0 - Gap horizontal extra grande
  static const SizedBox gapHorizontalXl = SizedBox(width: xl);

  /// 24.0 - Gap horizontal extra extra grande
  static const SizedBox gapHorizontalXxl = SizedBox(width: xxl);

  /// 28.0 - Gap horizontal extra extra extra grande
  static const SizedBox gapHorizontalXxxl = SizedBox(width: xxxl);

  /// 32.0 - Gap horizontal enorme
  static const SizedBox gapHorizontalHuge = SizedBox(width: huge);

  /// 40.0 - Gap horizontal masivo
  static const SizedBox gapHorizontalMassive = SizedBox(width: massive);

  /// 48.0 - Gap horizontal gigante
  static const SizedBox gapHorizontalGiant = SizedBox(width: giant);

  /// 56.0 - Gap horizontal mega
  static const SizedBox gapHorizontalMega = SizedBox(width: mega);

  /// 64.0 - Gap horizontal ultra
  static const SizedBox gapHorizontalUltra = SizedBox(width: ultra);
}
