/// Sistema de escalado base para toda la aplicación
///
/// Define los tamaños fundamentales que se reutilizan en spacing, radius, etc.
/// Usa una escala consistente y semántica para mantener coherencia visual.
///
/// **Uso básico:**
/// ```dart
/// // Tamaños base
/// SizedBox(width: AppSizes.md, height: AppSizes.lg);
///
/// // Iconos
/// Icon(Icons.home, size: AppSizes.iconLg);
///
/// // Avatares
/// CircleAvatar(radius: AppSizes.avatarMd);
///
/// // Elevaciones
/// elevation: AppSizes.elevationMd;
///
/// // Opacidades
/// opacity: AppSizes.opacityMedium;
/// ```
///
/// **Escala de tamaños:**
/// - `none` (0.0) - Sin tamaño
/// - `xxs` a `xxxl` (2.0 - 28.0) - Escala básica
/// - `huge`, `massive`, `giant` (32.0 - 48.0) - Tamaños grandes
/// - `mega`, `ultra`, `extreme`, `colossal` (56.0 - 96.0) - Tamaños extra grandes
class AppSizes {
  AppSizes._();

  // Escala base (0-10)
  /// 0.0 - Sin tamaño
  static const double none = 0.0;

  /// 2.0 - Extra extra pequeño
  static const double xxs = 2.0;

  /// 4.0 - Extra pequeño
  static const double xs = 4.0;

  /// 6.0 - Muy pequeño
  static const double sm = 6.0;

  /// 8.0 - Pequeño a mediano
  static const double smd = 8.0;

  /// 10.0 - Mediano pequeño
  static const double mds = 10.0;

  /// 12.0 - Mediano
  static const double md = 12.0;

  /// 14.0 - Mediano a largo
  static const double mdl = 14.0;

  /// 16.0 - Largo
  static const double lg = 16.0;

  /// 18.0 - Largo a extra largo
  static const double lgx = 18.0;

  /// 20.0 - Extra largo
  static const double xl = 20.0;

  /// 24.0 - Extra extra largo
  static const double xxl = 24.0;

  /// 28.0 - Extra extra extra largo
  static const double xxxl = 28.0;

  /// 32.0 - Enorme
  static const double huge = 32.0;

  /// 40.0 - Masivo
  static const double massive = 40.0;

  /// 48.0 - Gigante
  static const double giant = 48.0;

  /// 56.0 - Mega
  static const double mega = 56.0;

  /// 64.0 - Ultra
  static const double ultra = 64.0;

  /// 80.0 - Extremo
  static const double extreme = 80.0;

  /// 96.0 - Colosal
  static const double colossal = 96.0;

  // Tamaños de iconos (basados en Material Design)
  /// 12.0 - Ícono extra pequeño
  static const double iconXs = 12.0;

  /// 16.0 - Ícono pequeño
  static const double iconSm = 16.0;

  /// 20.0 - Ícono mediano
  static const double iconMd = 20.0;

  /// 24.0 - Tamaño estándar de Material Design
  static const double iconLg = 24.0;

  /// 32.0 - Ícono extra grande
  static const double iconXl = 32.0;

  /// 40.0 - Ícono muy grande
  static const double iconXxl = 40.0;

  /// 48.0 - Ícono enorme
  static const double iconHuge = 48.0;

  // Tamaños de avatares
  /// 24.0 - Avatar extra pequeño
  static const double avatarXs = 24.0;

  /// 32.0 - Avatar pequeño
  static const double avatarSm = 32.0;

  /// 40.0 - Avatar mediano (uso común en listas)
  static const double avatarMd = 40.0;

  /// 48.0 - Avatar grande
  static const double avatarLg = 48.0;

  /// 64.0 - Avatar extra grande
  static const double avatarXl = 64.0;

  /// 80.0 - Avatar muy grande
  static const double avatarXxl = 80.0;

  /// 96.0 - Avatar enorme
  static const double avatarHuge = 96.0;

  /// 128.0 - Avatar masivo (para perfiles)
  static const double avatarMassive = 128.0;

  // Anchos máximos (breakpoints)
  /// 600.0 - Ancho máximo para dispositivos móviles
  static const double maxMobileWidth = 600.0;

  /// 900.0 - Ancho máximo para tablets
  static const double maxTabletWidth = 900.0;

  /// 1200.0 - Ancho máximo para desktop
  static const double maxDesktopWidth = 1200.0;

  /// 1536.0 - Ancho máximo para contenido centrado
  static const double maxContentWidth = 1536.0;

  // Elevaciones (Material Design)
  /// 0.0 - Sin elevación
  static const double elevationNone = 0.0;

  /// 1.0 - Elevación mínima (cards en reposo)
  static const double elevationXs = 1.0;

  /// 2.0 - Elevación baja (botones, chips)
  static const double elevationSm = 2.0;

  /// 4.0 - Elevación estándar (cards elevadas, app bar)
  static const double elevationMd = 4.0;

  /// 6.0 - Elevación media (floating action button)
  static const double elevationLg = 6.0;

  /// 8.0 - Elevación alta (drawer, bottom sheet)
  static const double elevationXl = 8.0;

  /// 12.0 - Elevación muy alta (dialogs)
  static const double elevationXxl = 12.0;

  /// 16.0 - Elevación enorme (navigation drawer)
  static const double elevationHuge = 16.0;

  /// 24.0 - Elevación masiva (modal bottom sheet)
  static const double elevationMassive = 24.0;

  // Opacidades (Material Design)
  /// 0.0 - Completamente transparente
  static const double opacityNone = 0.0;

  /// 0.12 - Hover/Press sobre superficie (ripple effects)
  static const double opacityHover = 0.12;

  /// 0.38 - Estado deshabilitado (texto e iconos)
  static const double opacityDisabled = 0.38;

  /// 0.54 - Texto secundario y ayuda
  static const double opacityMedium = 0.54;

  /// 0.70 - Nivel medio-alto (elementos menos importantes)
  static const double opacityMediumHigh = 0.70;

  /// 0.87 - Texto activo y primario
  static const double opacityHigh = 0.87;

  /// 1.0 - Completamente opaco
  static const double opacityFull = 1.0;

  // Aspect Ratios
  /// 1.0 - Cuadrado perfecto (1:1)
  static const double aspectRatioSquare = 1.0;

  /// 1.33 - Formato estándar (4:3) - Común en fotografía tradicional
  static const double aspectRatioStandard = 4 / 3;

  /// 1.5 - Formato foto (3:2) - Cámaras DSLR
  static const double aspectRatioPhoto = 3 / 2;

  /// 1.78 - Widescreen (16:9) - Videos y pantallas modernas
  static const double aspectRatioWide = 16 / 9;

  /// 2.35 - Cinemático (21:9) - Películas y ultra-wide
  static const double aspectRatioCinematic = 21 / 9;
}

