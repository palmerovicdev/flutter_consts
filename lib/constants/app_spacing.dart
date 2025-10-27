import 'package:flutter/material.dart';
import 'app_sizes.dart';

/// Sistema de espaciado para mantener consistencia visual en padding, margin y gaps
///
/// [AppSpacing] proporciona una escala unificada de espaciado basada en [AppSizes],
/// con helpers convenientes para EdgeInsets y SizedBox. Esto garantiza coherencia
/// y facilita el diseño responsive.
///
/// ### 📦 Componentes Disponibles
///
/// 1. **Valores base** (double) - Para espaciado personalizado
/// 2. **EdgeInsets.all()** - Padding uniforme en todos los lados
/// 3. **EdgeInsets.symmetric(horizontal)** - Padding horizontal
/// 4. **EdgeInsets.symmetric(vertical)** - Padding vertical
/// 5. **SizedBox(height)** - Gaps verticales entre widgets
/// 6. **SizedBox(width)** - Gaps horizontales entre widgets
///
/// ### 📏 Escala de Espaciado
///
/// La escala completa (basada en [AppSizes]):
/// - `none` (0.0) → Sin espacio
/// - `xxs` (2.0) → Mínimo
/// - `xs` (4.0) → Extra pequeño
/// - `sm` (6.0) → Pequeño
/// - `smd` (8.0) → Pequeño-mediano
/// - `mds` (10.0) → Mediano-pequeño
/// - `md` (12.0) → Mediano ⭐ (más común)
/// - `mdl` (14.0) → Mediano-grande
/// - `lg` (16.0) → Grande (muy usado en screens)
/// - `lgx` (18.0) → Grande-extra
/// - `xl` (20.0) → Extra grande
/// - `xxl` (24.0) → Extra extra grande
/// - `xxxl` (28.0) → Triple extra grande
/// - `huge` (32.0) → Enorme
/// - `massive` (40.0) → Masivo
/// - `giant` (48.0) → Gigante
/// - `mega` (56.0) → Mega
/// - `ultra` (64.0) → Ultra
///
/// ### 🎨 Uso Básico
///
/// ```dart
/// // ✅ Valores base (double) - Para espaciado personalizado
/// SizedBox(height: AppSpacing.md)  // 12.0
/// Container(margin: EdgeInsets.all(AppSpacing.lg))  // 16.0
///
/// // ✅ Padding uniforme (EdgeInsets.all)
/// Padding(
///   padding: AppSpacing.paddingMd,  // EdgeInsets.all(12.0)
///   child: Text('Contenido con padding uniforme'),
/// )
///
/// // ✅ Padding horizontal (EdgeInsets.symmetric)
/// Container(
///   padding: AppSpacing.horizontalLg,  // horizontal: 16.0
///   child: Row(
///     children: [
///       Text('Contenido con margen lateral'),
///     ],
///   ),
/// )
///
/// // ✅ Padding vertical (EdgeInsets.symmetric)
/// Container(
///   padding: AppSpacing.verticalMd,  // vertical: 12.0
///   child: Column(
///     children: [
///       Text('Espaciado arriba y abajo'),
///     ],
///   ),
/// )
///
/// // ✅ Gaps verticales en Column
/// Column(
///   children: [
///     Text('Elemento 1'),
///     AppSpacing.gapMd,      // SizedBox(height: 12.0)
///     Text('Elemento 2'),
///     AppSpacing.gapLg,      // SizedBox(height: 16.0)
///     Text('Elemento 3'),
///   ],
/// )
///
/// // ✅ Gaps horizontales en Row
/// Row(
///   children: [
///     Icon(Icons.star),
///     AppSpacing.gapHorizontalSm,  // SizedBox(width: 6.0)
///     Text('5.0'),
///   ],
/// )
/// ```
///
/// ### 📱 Patrones Comunes por Dispositivo
///
/// **Mobile:**
/// ```dart
/// // Padding de screen
/// Padding(padding: AppSpacing.paddingLg)  // 16.0
///
/// // Separación entre secciones
/// AppSpacing.gapXl  // 20.0
///
/// // Separación entre elementos
/// AppSpacing.gapMd  // 12.0
/// ```
///
/// **Tablet:**
/// ```dart
/// // Padding de screen
/// Padding(padding: AppSpacing.paddingXl)  // 20.0
///
/// // Separación entre secciones
/// AppSpacing.gapXxl  // 24.0
///
/// // Separación entre elementos
/// AppSpacing.gapLg  // 16.0
/// ```
///
/// **Desktop:**
/// ```dart
/// // Padding de screen
/// Padding(padding: AppSpacing.paddingXxl)  // 24.0
///
/// // Separación entre secciones
/// AppSpacing.gapHuge  // 32.0
///
/// // Separación entre elementos
/// AppSpacing.gapXl  // 20.0
/// ```
///
/// ### 🎯 Guía de Uso por Contexto
///
/// **Cards y Containers:**
/// ```dart
/// Card(
///   child: Padding(
///     padding: AppSpacing.paddingMd,  // Padding interno estándar
///     child: Column(
///       children: [
///         Text('Título'),
///         AppSpacing.gapSm,  // Separación pequeña
///         Text('Descripción'),
///       ],
///     ),
///   ),
/// )
/// ```
///
/// **List Items:**
/// ```dart
/// ListTile(
///   contentPadding: AppSpacing.horizontalLg,  // Padding lateral
///   title: Text('Item'),
/// )
/// ```
///
/// **Forms:**
/// ```dart
/// Column(
///   children: [
///     TextField(),
///     AppSpacing.gapMd,  // Separación entre campos
///     TextField(),
///     AppSpacing.gapXl,  // Separación antes del botón
///     ElevatedButton(child: Text('Enviar')),
///   ],
/// )
/// ```
///
/// **Sections:**
/// ```dart
/// Column(
///   crossAxisAlignment: CrossAxisAlignment.start,
///   children: [
///     Text('Sección 1', style: headlineStyle),
///     AppSpacing.gapMd,  // Separación título-contenido
///     Text('Contenido...'),
///     AppSpacing.gapXxl,  // Separación entre secciones
///     Text('Sección 2', style: headlineStyle),
///   ],
/// )
/// ```
///
/// ### 💡 Recomendaciones
///
/// 1. **Consistencia**: Usa siempre la escala de AppSpacing, no valores arbitrarios
/// 2. **Jerarquía**: Más espacio = más separación conceptual
/// 3. **Responsive**: Ajusta el espaciado según el dispositivo
/// 4. **Gaps vs Padding**:
///    - Usa `gap*` para separar widgets en Column/Row
///    - Usa `padding*` para espacio interno de containers
/// 5. **Valores comunes**:
///    - `md` (12.0) → Padding interno general
///    - `lg` (16.0) → Padding de screens mobile
///    - `xl` (20.0) → Separación entre secciones
///
/// ### ❌ Evitar
///
/// ```dart
/// // ❌ NO uses valores arbitrarios
/// Padding(padding: EdgeInsets.all(13.5))
/// SizedBox(height: 17.3)
///
/// // ✅ USA la escala predefinida
/// Padding(padding: AppSpacing.paddingMd)  // 12.0
/// AppSpacing.gapLg  // 16.0
/// ```
///
/// ### 🔗 Ver también
///
/// - [AppSizes] para la escala base de tamaños
/// - [AppRadius] para border radius consistente
/// - [AppFontSizes] para tipografía jerárquica
///
/// ### 📚 Referencias
///
/// - [Material Design - Spacing](https://material.io/design/layout/spacing-methods.html)
/// - [Material Design - Layout](https://material.io/design/layout/understanding-layout.html)
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
  static const EdgeInsets horizontalXxxl =
      EdgeInsets.symmetric(horizontal: xxxl);

  /// 32.0 - Padding horizontal enorme
  static const EdgeInsets horizontalHuge =
      EdgeInsets.symmetric(horizontal: huge);

  /// 40.0 - Padding horizontal masivo
  static const EdgeInsets horizontalMassive =
      EdgeInsets.symmetric(horizontal: massive);

  /// 48.0 - Padding horizontal gigante
  static const EdgeInsets horizontalGiant =
      EdgeInsets.symmetric(horizontal: giant);

  /// 56.0 - Padding horizontal mega
  static const EdgeInsets horizontalMega =
      EdgeInsets.symmetric(horizontal: mega);

  /// 64.0 - Padding horizontal ultra
  static const EdgeInsets horizontalUltra =
      EdgeInsets.symmetric(horizontal: ultra);

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
  static const EdgeInsets verticalMassive =
      EdgeInsets.symmetric(vertical: massive);

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

/// Valores base de espaciado como `double`
///
/// Proporciona acceso a los valores numéricos base del espaciado
/// para usar en constructores personalizados.
///
/// ### 🎨 Uso
///
/// ```dart
/// // Espaciado personalizado
/// SizedBox(height: AppSpacingBase._().md)  // 12.0
/// Container(margin: EdgeInsets.all(AppSpacingBase._().lg))  // 16.0
/// ```
class AppSpacingBase {
  const AppSpacingBase._();

  /// 0.0 - Sin espaciado
  double get none => AppSpacing.none;

  /// 2.0 - Extra extra pequeño
  double get xxs => AppSpacing.xxs;

  /// 4.0 - Extra pequeño
  double get xs => AppSpacing.xs;

  /// 6.0 - Pequeño
  double get sm => AppSpacing.sm;

  /// 8.0 - Pequeño-mediano
  double get smd => AppSpacing.smd;

  /// 10.0 - Mediano-pequeño
  double get mds => AppSpacing.mds;

  /// 12.0 - Mediano (uso común)
  double get md => AppSpacing.md;

  /// 14.0 - Mediano-grande
  double get mdl => AppSpacing.mdl;

  /// 16.0 - Grande (muy usado en layouts)
  double get lg => AppSpacing.lg;

  /// 18.0 - Grande-extra
  double get lgx => AppSpacing.lgx;

  /// 20.0 - Extra grande
  double get xl => AppSpacing.xl;

  /// 24.0 - Extra extra grande
  double get xxl => AppSpacing.xxl;

  /// 28.0 - Extra extra extra grande
  double get xxxl => AppSpacing.xxxl;

  /// 32.0 - Enorme
  double get huge => AppSpacing.huge;

  /// 40.0 - Masivo
  double get massive => AppSpacing.massive;

  /// 48.0 - Gigante
  double get giant => AppSpacing.giant;

  /// 56.0 - Mega
  double get mega => AppSpacing.mega;

  /// 64.0 - Ultra
  double get ultra => AppSpacing.ultra;
}

/// EdgeInsets con padding uniforme (EdgeInsets.all)
///
/// Proporciona EdgeInsets pre-configurados con padding igual en todos los lados.
///
/// ### 🎨 Uso
///
/// ```dart
/// Padding(
///   padding: AppSpacingPadding._().md,  // EdgeInsets.all(12.0)
///   child: Text('Contenido'),
/// )
///
/// Container(
///   padding: AppSpacingPadding._().lg,  // EdgeInsets.all(16.0)
///   child: ...,
/// )
/// ```
class AppSpacingPadding {
  const AppSpacingPadding._();

  /// 0.0 - Sin padding
  EdgeInsets get none => AppSpacing.paddingNone;

  /// 2.0 - Padding extra extra pequeño
  EdgeInsets get xxs => AppSpacing.paddingXxs;

  /// 4.0 - Padding extra pequeño
  EdgeInsets get xs => AppSpacing.paddingXs;

  /// 6.0 - Padding pequeño
  EdgeInsets get sm => AppSpacing.paddingSm;

  /// 8.0 - Padding pequeño-mediano
  EdgeInsets get smd => AppSpacing.paddingSmd;

  /// 10.0 - Padding mediano-pequeño
  EdgeInsets get mds => AppSpacing.paddingMds;

  /// 12.0 - Padding mediano (uso común)
  EdgeInsets get md => AppSpacing.paddingMd;

  /// 14.0 - Padding mediano-grande
  EdgeInsets get mdl => AppSpacing.paddingMdl;

  /// 16.0 - Padding grande (muy usado)
  EdgeInsets get lg => AppSpacing.paddingLg;

  /// 18.0 - Padding grande-extra
  EdgeInsets get lgx => AppSpacing.paddingLgx;

  /// 20.0 - Padding extra grande
  EdgeInsets get xl => AppSpacing.paddingXl;

  /// 24.0 - Padding extra extra grande
  EdgeInsets get xxl => AppSpacing.paddingXxl;

  /// 28.0 - Padding extra extra extra grande
  EdgeInsets get xxxl => AppSpacing.paddingXxxl;

  /// 32.0 - Padding enorme
  EdgeInsets get huge => AppSpacing.paddingHuge;

  /// 40.0 - Padding masivo
  EdgeInsets get massive => AppSpacing.paddingMassive;

  /// 48.0 - Padding gigante
  EdgeInsets get giant => AppSpacing.paddingGiant;

  /// 56.0 - Padding mega
  EdgeInsets get mega => AppSpacing.paddingMega;

  /// 64.0 - Padding ultra
  EdgeInsets get ultra => AppSpacing.paddingUltra;
}

/// EdgeInsets con padding horizontal (EdgeInsets.symmetric)
///
/// Proporciona EdgeInsets pre-configurados con padding solo en los lados.
///
/// ### 🎨 Uso
///
/// ```dart
/// Container(
///   padding: AppSpacingHorizontal._().lg,  // EdgeInsets.symmetric(horizontal: 16.0)
///   child: Row(
///     children: [...],
///   ),
/// )
/// ```
class AppSpacingHorizontal {
  const AppSpacingHorizontal._();

  /// 0.0 - Sin padding horizontal
  EdgeInsets get none => AppSpacing.horizontalNone;

  /// 2.0 - Padding horizontal extra extra pequeño
  EdgeInsets get xxs => AppSpacing.horizontalXxs;

  /// 4.0 - Padding horizontal extra pequeño
  EdgeInsets get xs => AppSpacing.horizontalXs;

  /// 6.0 - Padding horizontal pequeño
  EdgeInsets get sm => AppSpacing.horizontalSm;

  /// 8.0 - Padding horizontal pequeño-mediano
  EdgeInsets get smd => AppSpacing.horizontalSmd;

  /// 10.0 - Padding horizontal mediano-pequeño
  EdgeInsets get mds => AppSpacing.horizontalMds;

  /// 12.0 - Padding horizontal mediano
  EdgeInsets get md => AppSpacing.horizontalMd;

  /// 14.0 - Padding horizontal mediano-grande
  EdgeInsets get mdl => AppSpacing.horizontalMdl;

  /// 16.0 - Padding horizontal grande (muy usado en screens)
  EdgeInsets get lg => AppSpacing.horizontalLg;

  /// 18.0 - Padding horizontal grande-extra
  EdgeInsets get lgx => AppSpacing.horizontalLgx;

  /// 20.0 - Padding horizontal extra grande
  EdgeInsets get xl => AppSpacing.horizontalXl;

  /// 24.0 - Padding horizontal extra extra grande
  EdgeInsets get xxl => AppSpacing.horizontalXxl;

  /// 28.0 - Padding horizontal extra extra extra grande
  EdgeInsets get xxxl => AppSpacing.horizontalXxxl;

  /// 32.0 - Padding horizontal enorme
  EdgeInsets get huge => AppSpacing.horizontalHuge;

  /// 40.0 - Padding horizontal masivo
  EdgeInsets get massive => AppSpacing.horizontalMassive;

  /// 48.0 - Padding horizontal gigante
  EdgeInsets get giant => AppSpacing.horizontalGiant;

  /// 56.0 - Padding horizontal mega
  EdgeInsets get mega => AppSpacing.horizontalMega;

  /// 64.0 - Padding horizontal ultra
  EdgeInsets get ultra => AppSpacing.horizontalUltra;
}

/// EdgeInsets con padding vertical (EdgeInsets.symmetric)
///
/// Proporciona EdgeInsets pre-configurados con padding solo arriba y abajo.
///
/// ### 🎨 Uso
///
/// ```dart
/// Container(
///   padding: AppSpacingVertical._().md,  // EdgeInsets.symmetric(vertical: 12.0)
///   child: Column(
///     children: [...],
///   ),
/// )
/// ```
class AppSpacingVertical {
  const AppSpacingVertical._();

  /// 0.0 - Sin padding vertical
  EdgeInsets get none => AppSpacing.verticalNone;

  /// 2.0 - Padding vertical extra extra pequeño
  EdgeInsets get xxs => AppSpacing.verticalXxs;

  /// 4.0 - Padding vertical extra pequeño
  EdgeInsets get xs => AppSpacing.verticalXs;

  /// 6.0 - Padding vertical pequeño
  EdgeInsets get sm => AppSpacing.verticalSm;

  /// 8.0 - Padding vertical pequeño-mediano
  EdgeInsets get smd => AppSpacing.verticalSmd;

  /// 10.0 - Padding vertical mediano-pequeño
  EdgeInsets get mds => AppSpacing.verticalMds;

  /// 12.0 - Padding vertical mediano
  EdgeInsets get md => AppSpacing.verticalMd;

  /// 14.0 - Padding vertical mediano-grande
  EdgeInsets get mdl => AppSpacing.verticalMdl;

  /// 16.0 - Padding vertical grande
  EdgeInsets get lg => AppSpacing.verticalLg;

  /// 18.0 - Padding vertical grande-extra
  EdgeInsets get lgx => AppSpacing.verticalLgx;

  /// 20.0 - Padding vertical extra grande
  EdgeInsets get xl => AppSpacing.verticalXl;

  /// 24.0 - Padding vertical extra extra grande
  EdgeInsets get xxl => AppSpacing.verticalXxl;

  /// 28.0 - Padding vertical extra extra extra grande
  EdgeInsets get xxxl => AppSpacing.verticalXxxl;

  /// 32.0 - Padding vertical enorme
  EdgeInsets get huge => AppSpacing.verticalHuge;

  /// 40.0 - Padding vertical masivo
  EdgeInsets get massive => AppSpacing.verticalMassive;

  /// 48.0 - Padding vertical gigante
  EdgeInsets get giant => AppSpacing.verticalGiant;

  /// 56.0 - Padding vertical mega
  EdgeInsets get mega => AppSpacing.verticalMega;

  /// 64.0 - Padding vertical ultra
  EdgeInsets get ultra => AppSpacing.verticalUltra;
}

/// SizedBox para gaps verticales (altura)
///
/// Proporciona SizedBox pre-configurados para separar widgets verticalmente
/// en Column o layouts verticales.
///
/// ### 🎨 Uso
///
/// ```dart
/// Column(
///   children: [
///     Text('Elemento 1'),
///     AppSpacingGap._().md,  // SizedBox(height: 12.0)
///     Text('Elemento 2'),
///     AppSpacingGap._().lg,  // SizedBox(height: 16.0)
///     Text('Elemento 3'),
///   ],
/// )
/// ```
class AppSpacingGap {
  const AppSpacingGap._();

  /// 0.0 - Sin espacio vertical
  SizedBox get none => AppSpacing.gapNone;

  /// 2.0 - Gap vertical extra extra pequeño
  SizedBox get xxs => AppSpacing.gapXxs;

  /// 4.0 - Gap vertical extra pequeño
  SizedBox get xs => AppSpacing.gapXs;

  /// 6.0 - Gap vertical pequeño
  SizedBox get sm => AppSpacing.gapSm;

  /// 8.0 - Gap vertical pequeño-mediano
  SizedBox get smd => AppSpacing.gapSmd;

  /// 10.0 - Gap vertical mediano-pequeño
  SizedBox get mds => AppSpacing.gapMds;

  /// 12.0 - Gap vertical mediano
  SizedBox get md => AppSpacing.gapMd;

  /// 14.0 - Gap vertical mediano-grande
  SizedBox get mdl => AppSpacing.gapMdl;

  /// 16.0 - Gap vertical grande (común en Column)
  SizedBox get lg => AppSpacing.gapLg;

  /// 18.0 - Gap vertical grande-extra
  SizedBox get lgx => AppSpacing.gapLgx;

  /// 20.0 - Gap vertical extra grande
  SizedBox get xl => AppSpacing.gapXl;

  /// 24.0 - Gap vertical extra extra grande
  SizedBox get xxl => AppSpacing.gapXxl;

  /// 28.0 - Gap vertical extra extra extra grande
  SizedBox get xxxl => AppSpacing.gapXxxl;

  /// 32.0 - Gap vertical enorme
  SizedBox get huge => AppSpacing.gapHuge;

  /// 40.0 - Gap vertical masivo
  SizedBox get massive => AppSpacing.gapMassive;

  /// 48.0 - Gap vertical gigante
  SizedBox get giant => AppSpacing.gapGiant;

  /// 56.0 - Gap vertical mega
  SizedBox get mega => AppSpacing.gapMega;

  /// 64.0 - Gap vertical ultra
  SizedBox get ultra => AppSpacing.gapUltra;
}

/// SizedBox para gaps horizontales (ancho)
///
/// Proporciona SizedBox pre-configurados para separar widgets horizontalmente
/// en Row o layouts horizontales.
///
/// ### 🎨 Uso
///
/// ```dart
/// Row(
///   children: [
///     Icon(Icons.star),
///     AppSpacingGapHorizontal._().sm,  // SizedBox(width: 6.0)
///     Text('5.0'),
///   ],
/// )
/// ```
class AppSpacingGapHorizontal {
  const AppSpacingGapHorizontal._();

  /// 0.0 - Sin espacio horizontal
  SizedBox get none => AppSpacing.gapHorizontalNone;

  /// 2.0 - Gap horizontal extra extra pequeño
  SizedBox get xxs => AppSpacing.gapHorizontalXxs;

  /// 4.0 - Gap horizontal extra pequeño
  SizedBox get xs => AppSpacing.gapHorizontalXs;

  /// 6.0 - Gap horizontal pequeño
  SizedBox get sm => AppSpacing.gapHorizontalSm;

  /// 8.0 - Gap horizontal pequeño-mediano
  SizedBox get smd => AppSpacing.gapHorizontalSmd;

  /// 10.0 - Gap horizontal mediano-pequeño
  SizedBox get mds => AppSpacing.gapHorizontalMds;

  /// 12.0 - Gap horizontal mediano
  SizedBox get md => AppSpacing.gapHorizontalMd;

  /// 14.0 - Gap horizontal mediano-grande
  SizedBox get mdl => AppSpacing.gapHorizontalMdl;

  /// 16.0 - Gap horizontal grande (común en Row)
  SizedBox get lg => AppSpacing.gapHorizontalLg;

  /// 18.0 - Gap horizontal grande-extra
  SizedBox get lgx => AppSpacing.gapHorizontalLgx;

  /// 20.0 - Gap horizontal extra grande
  SizedBox get xl => AppSpacing.gapHorizontalXl;

  /// 24.0 - Gap horizontal extra extra grande
  SizedBox get xxl => AppSpacing.gapHorizontalXxl;

  /// 28.0 - Gap horizontal extra extra extra grande
  SizedBox get xxxl => AppSpacing.gapHorizontalXxxl;

  /// 32.0 - Gap horizontal enorme
  SizedBox get huge => AppSpacing.gapHorizontalHuge;

  /// 40.0 - Gap horizontal masivo
  SizedBox get massive => AppSpacing.gapHorizontalMassive;

  /// 48.0 - Gap horizontal gigante
  SizedBox get giant => AppSpacing.gapHorizontalGiant;

  /// 56.0 - Gap horizontal mega
  SizedBox get mega => AppSpacing.gapHorizontalMega;

  /// 64.0 - Gap horizontal ultra
  SizedBox get ultra => AppSpacing.gapHorizontalUltra;
}

/// Sistema jerárquico de acceso a todos los tipos de espaciado
///
/// Esta clase proporciona una estructura organizada para acceder a todas
/// las variantes de espaciado disponibles en la aplicación.
///
/// ### 🎨 Uso
///
/// ```dart
/// // Valores base (double)
/// double spacing = AppSpacingSystem().base.md;  // 12.0
///
/// // Padding uniforme
/// Padding(
///   padding: AppSpacingSystem().padding.lg,  // EdgeInsets.all(16.0)
///   child: ...,
/// )
///
/// // Padding horizontal
/// Container(
///   padding: AppSpacingSystem().horizontal.lg,  // EdgeInsets.symmetric(horizontal: 16.0)
///   child: ...,
/// )
///
/// // Padding vertical
/// Container(
///   padding: AppSpacingSystem().vertical.md,  // EdgeInsets.symmetric(vertical: 12.0)
///   child: ...,
/// )
///
/// // Gaps verticales
/// Column(
///   children: [
///     Text('Item 1'),
///     AppSpacingSystem().gap.md,  // SizedBox(height: 12.0)
///     Text('Item 2'),
///   ],
/// )
///
/// // Gaps horizontales
/// Row(
///   children: [
///     Icon(Icons.star),
///     AppSpacingSystem().gapHorizontal.sm,  // SizedBox(width: 6.0)
///     Text('5.0'),
///   ],
/// )
/// ```
///
/// ### 📋 Estructura del sistema
///
/// - `base` → [AppSpacingBase] - Valores double base
/// - `padding` → [AppSpacingPadding] - EdgeInsets.all()
/// - `horizontal` → [AppSpacingHorizontal] - EdgeInsets.symmetric(horizontal)
/// - `vertical` → [AppSpacingVertical] - EdgeInsets.symmetric(vertical)
/// - `gap` → [AppSpacingGap] - SizedBox(height) para Column
/// - `gapHorizontal` → [AppSpacingGapHorizontal] - SizedBox(width) para Row
///
/// ### 💡 Comparación con AppSpacing estático
///
/// ```dart
/// // Sistema jerárquico (más verboso)
/// AppSpacingSystem().padding.md
///
/// // Acceso estático (más directo) ⭐
/// AppSpacing.paddingMd
///
/// // Ambos son equivalentes, usa el que prefieras
/// ```
///
/// ### 💡 Ver también
///
/// - [AppSpacing] para acceso estático directo (recomendado)
/// - [AppSizes] para la escala base de tamaños
/// - [AppRadius] para border radius consistente
class AppSpacingSystem {
  /// Valores base de espaciado como `double`
  AppSpacingBase get base => AppSpacingBase._();

  /// EdgeInsets con padding uniforme (EdgeInsets.all)
  AppSpacingPadding get padding => AppSpacingPadding._();

  /// EdgeInsets con padding horizontal (EdgeInsets.symmetric horizontal)
  AppSpacingHorizontal get horizontal => AppSpacingHorizontal._();

  /// EdgeInsets con padding vertical (EdgeInsets.symmetric vertical)
  AppSpacingVertical get vertical => AppSpacingVertical._();

  /// SizedBox para gaps verticales (altura)
  AppSpacingGap get gap => AppSpacingGap._();

  /// SizedBox para gaps horizontales (ancho)
  AppSpacingGapHorizontal get gapHorizontal => AppSpacingGapHorizontal._();
}

